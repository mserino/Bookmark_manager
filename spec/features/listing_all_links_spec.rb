require 'spec_helper'

feature "User browses the list of links" do
	
	before(:each) do
		Link.create(:url => "http://www.makersacademy.com",
								:title => "Makers Academy",
								:description => 'Learn to code in 12 weeks',
								:tags => [Tag.first_or_create(:text => 'education')])
		Link.create(:url => "http://www.google.com",
								:title => "Google",
								:description => 'Search engine',
								:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.bing.com",
								:title => "Bing",
								:description => 'Lame search engine',
								:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.code.org",
								:title => "Code.org",
								:description => 'Online coding school',
								:tags => [Tag.first_or_create(:text => 'education')])
	end

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content("Makers Academy")
	end

	scenario 'filtered by a tag' do
		visit '/tags/search'
		within '#links-container' do
			expect(page).not_to have_content("Makers Academy")
			expect(page).not_to have_content("Code.org")
			expect(page).to have_content("Google")
			expect(page).to have_content("Bing")
		end
	end

	scenario 'and can see the description' do
		visit '/'
			expect(page).to have_content 'Learn to code in 12 weeks'
			expect(page).to have_content 'Search engine'
			expect(page).to have_content 'Lame search engine'
			expect(page).to have_content 'Online coding school'
	end
end