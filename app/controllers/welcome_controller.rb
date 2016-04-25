require 'json'
require 'open-uri'
require 'rubygems'
require 'mongo'

include Mongo
class WelcomeController < ApplicationController

  # GET /welcome
  def datasend
	db = Mongo::Client.new([ 'ds047652.mlab.com:47652' ], :database => 'heroku_bwj16nq9', :user => 'taral', :password => 'taral')

	k=params[:Id]
	rs2 = db[:heroku_bwj16nq9].find({:ID => k}).to_json
	render :json => rs2
	end
end
