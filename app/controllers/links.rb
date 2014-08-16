post '/links' do
	url = params['url']
	title = params['title']
	description = params['description']
	tags = params['tags'].split(" ").map do |tag|
		Tag.first_or_create(:text => tag)
	end
	Link.create(:url => url, :title => title, :description => description, :tags => tags)
	redirect to('/')
end

get '/links/new' do
  erb :"links/new", :layout => :layout
end