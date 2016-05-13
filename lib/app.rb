require 'sinatra'
require 'rest-client'
require_relative 'candidate'

get '/' do
  @family_totals = Candidate.get_family_totals
  @artisan_count = @family_totals["artisans"]
  @delivery_count = @family_totals["delivery"]
  @ux_count = @family_totals["ux"]
  @consultant_count = @family_totals["consultants"]
  @devops_count = @family_totals["devops"]
  @candidate_count = @artisan_count + @delivery_count + @ux_count + @consultant_count + @devops_count
  erb :index
end


