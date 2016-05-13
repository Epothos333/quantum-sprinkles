class Candidate

  API_KEY = 'D9PNCCQl8ZtdF7zjtGksn2h4x2jZltP5'
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

    return {"artisans"=>artisans_count, "delivery"=>delivery_count}
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
