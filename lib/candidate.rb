class Candidate

  API_KEY = ENV['JAZZ_KEY']
  API_BASE_URL = 'https://api.resumatorapi.com/v1/'

  def self.total
    json_result = RestClient.get("#{API_BASE_URL}applicants?apikey=#{API_KEY}")
    JSON.parse(json_result).length
  end

  def self.get_family_totals
    json_result = RestClient.get("#{API_BASE_URL}applicants?apikey=#{API_KEY}")
    applicants = JSON.parse(json_result)

    artisans_count = applicants.select {|applicant| is_artisan(applicant) }.length
    delivery_count = applicants.select {|applicant| is_delivery(applicant) }.length

    ux_count = 0
    consultant_count = 0
    devops_count = 0

    return {"artisans"=>artisans_count, "delivery"=>delivery_count, "ux"=>ux_count, "consultants"=>consultant_count, "devops"=>devops_count}
  end

  def self.is_delivery(applicant)
    delivery_job_titles = ["Delivery Lead"]
    delivery_job_titles.include? applicant["job_title"]
  end

  def self.is_artisan(applicant)
    artisan_job_titles = ["Software Apprentice Developer", "Software Journeyman Developer", "Software Craftsman Developer"]
    artisan_job_titles.include? applicant["job_title"]
  end

end
