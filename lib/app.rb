require 'sinatra'
require 'rest-client'
require_relative 'candidate'

get '/' do

  "Quantum Sprinkles, Total: #{Candidate.total}"
end

