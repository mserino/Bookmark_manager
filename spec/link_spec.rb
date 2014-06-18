require 'spec_helper'

describe Link do
	
	#testing directly the database without passing through the web interface	
	context 'Demonstration of how datamapper works' do

		it 'should be created and retrieved from the db' do
			# in the beginning our database is empty, so there are no links
			expect(Link.count).to eq 0
			# this creates it in the database, so it's stored on the disk
			Link.create(:title => "Makers Academy",
									:url => "http://www.makersacademy.com")
			# we ask the database how many links we have, it should be 1
			expect(Link.count).to eq 1
			# let's get the first (and only) link from the database
			link = Link.first
			# now it has all properties that it was saved with
			expect(link.url).to eq("http://www.makersacademy.com")
			expect(link.title).to eq("Makers Academy")
			# we can destroy it
			link.destroy
			expect(Link.count).to eq 0
		end
	end
end