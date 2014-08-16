# This class corresponds to a table in the database
# We can use it to manipulate the data
class Link
	
	# instance of this class Datamapper resources
	include DataMapper::Resource

	#this block describes what resources our model will have

	property :id,			Serial
	property :title,	String
	property :url,		String
	property :description, Text
	has n, :tags, :through => Resource

end