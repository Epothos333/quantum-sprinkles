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

  @candidateLocation = Candidate.get_family_totals_by_region('OVR')
  @artisan_count_ovr = @candidateLocation["artisans"]
  @delivery_count_ovr = @candidateLocation["delivery"]
  @ux_count_ovr = @candidateLocation["ux"]
  @consultant_count_ovr = @candidateLocation["consultants"]
  @devops_count_ovr = @candidateLocation["devops"]




  @labels = ["Artisans","Delivery","UX","Consultants","Devops"]
  @counts = [@artisan_count_ovr,@delivery_count_ovr,@ux_count_ovr,@consultant_count_ovr,@devops_count_ovr]
  @colors = ["#9B59B6","#26B99A","#3498DB","#284C59","#F22554"]

  @data2 = [
              [@labels[0], @counts[0], @colors[0]],
              [@labels[1], @counts[1], @colors[1]],
              [@labels[2], @counts[2], @colors[2]],
              [@labels[3], @counts[3], @colors[3]],
              [@labels[4], @counts[4], @colors[4]]
  ]

  @candidateLocation_ihr = Candidate.get_family_totals_by_region('IHR')
  @artisan_count_ihr = @candidateLocation_ihr["artisans"]
  @delivery_count_ihr = @candidateLocation_ihr["delivery"]
  @ux_count_ihr = @candidateLocation_ihr["ux"]
  @consultant_count_ihr = @candidateLocation_ihr["consultants"]
  @devops_count_ihr = @candidateLocation_ihr["devops"]

  


  @labels_ihr = ["Artisans","Delivery","UX","Consultants","Devops"]
  @counts_ihr = [@artisan_count_ihr,@delivery_count_ihr,@ux_count_ihr,@consultant_count_ihr,@devops_count_ihr]
  @colors_ihr = ["#9B59B6","#26B99A","#3498DB","#284C59","#F22554"]

  @data2_ihr = [
              [@labels_ihr[0], @counts_ihr[0], @colors_ihr[0]],
              [@labels_ihr[1], @counts_ihr[1], @colors_ihr[1]],
              [@labels_ihr[2], @counts_ihr[2], @colors_ihr[2]],
              [@labels_ihr[3], @counts_ihr[3], @colors_ihr[3]],
              [@labels_ihr[4], @counts_ihr[4], @colors_ihr[4]]
  ]

  @candidateLocation_glr = Candidate.get_family_totals_by_region('GLR')
  @artisan_count_glr = @candidateLocation_glr["artisans"]
  @delivery_count_glr = @candidateLocation_glr["delivery"]
  @ux_count_glr = @candidateLocation_glr["ux"]
  @consultant_count_glr = @candidateLocation_glr["consultants"]
  @devops_count_glr = @candidateLocation_glr["devops"]

  


  @labels_glr = ["Artisans","Delivery","UX","Consultants","Devops"]
  @counts_glr = [@artisan_count_glr,@delivery_count_glr,@ux_count_glr,@consultant_count_glr,@devops_count_glr]
  @colors_glr = ["#9B59B6","#26B99A","#3498DB","#284C59","#F22554"]

  @data2_glr = [
              [@labels_glr[0], @counts_glr[0], @colors_glr[0]],
              [@labels_glr[1], @counts_glr[1], @colors_glr[1]],
              [@labels_glr[2], @counts_glr[2], @colors_glr[2]],
              [@labels_glr[3], @counts_glr[3], @colors_glr[3]],
              [@labels_glr[4], @counts_glr[4], @colors_glr[4]]
  ]

  erb :index
end


