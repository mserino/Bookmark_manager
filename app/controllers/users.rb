get '/users/new' do
	@user = User.new
	erb :'users/new', :layout => :layout
end

post '/users' do
	@user = User.new(:email => params[:email],
										 :password => params[:password],
										 :password_confirmation => params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect to('/')
	else
		flash.now[:errors] = @user.errors.full_messages
		erb :'users/new', :layout => :layout
	end
end


get '/users/recover' do
	erb :"users/recover", :layout => :layout
end

post '/recover' do
	email = params[:email]
	user = User.first(:email => email) # avoid having to memorise ascii codes
	if user
		user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
		user.password_token_time = Time.now
		user.save
		flash[:notice] = ['An email with the instructions to reset the password has been sent.']
	else
		flash[:notice] = ["This email doesn't exist"]
	end
end