require 'sinatra'
require 'rest-client'
require_relative 'candidate'

get '/' do
  @candidate_count = Candidate.total
  @artisan_count = Candidate.artisans
  erb :index
end


