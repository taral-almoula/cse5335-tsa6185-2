require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo
class WelcomeController < ApplicationController
i = 0
count = 0

database = Mongo::Client.new([ 'ds047652.mlab.com:47652' ], :database => 'heroku_bwj16nq9', :user => 'taral', :password => 'taral')
puts '-------------------------------------------------------------------------------------------------------------------------'
while i < 1  do
	#DATA SOURCE: http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json 
    data = JSON.parse(open("http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&artist=editors&api_key=4d7847876fa96f67f881aaf1b73e0e30&format=json").read)
      
      # iterate through the Array of returned artists and print their names                                                                                 
        data["similarartists"]["artist"].each do |artist|
        
        insertintable = database[:heroku_bwj16nq9].insert_one({ID: count.to_s, Title: artist["name"]})
        
        count = count + 1;
      end

    i = i + 1;
end
  # GET /welcome
  def datasend
	db = Mongo::Client.new([ 'ds047652.mlab.com:47652' ], :database => 'heroku_bwj16nq9', :user => 'taral', :password => 'taral')

	k=params[:Id]
	rs2 = db[:heroku_bwj16nq9].find({:ID => k}).to_json
	render :json => rs2
	end
end
