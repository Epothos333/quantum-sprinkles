require 'sinatra'
require 'rest-client'
require_relative 'candidate'

get '/' do
  @candidate_count = Candidate.total
  erb :index
end

