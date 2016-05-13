require 'sinatra'
require 'rest-client'
require_relative 'candidate'

get '/' do
  @candidate_count = Candidate.total
  @artisan_count = Candidate.get_family_totals["artisans"]
  @delivery_count = Candidate.get_family_totals["delivery"]
  @ux_count = Candidate.get_family_totals["ux"]
  @consultant_count = Candidate.get_family_totals["consultants"]
  @devops_count = Candidate.get_family_totals["devops"]
  erb :index
end


