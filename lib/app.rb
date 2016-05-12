require 'sinatra'
require 'rest-client'

get '/' do

  json_result = RestClient.get("https://api.resumatorapi.com/v1/applicants?apikey=D9PNCCQl8ZtdF7zjtGksn2h4x2jZltP5")
  candidate_count = JSON.parse(json_result).length

  "Quantum Sprinkles, Total: #{candidate_count}"
end

