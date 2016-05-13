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
  
  @family_totals2 = Candidate.get_family_totals


  @labels = ["Delivery Leads","DX","Dev","DevOps","Consulting"]
  @counts = [2,3,4,5,6]
  @colors = ["#9B59B6","#26B99A","#3498DB","#284C59","#F22554"]

  @data2 = [
              [@labels[0], @counts[0], @colors[0]],
              [@labels[1], @counts[1], @colors[1]],
              [@labels[2], @counts[2], @colors[2]],
              [@labels[3], @counts[3], @colors[3]],
              [@labels[4], @counts[4], @colors[4]]
  ]
  
  erb :index
end


