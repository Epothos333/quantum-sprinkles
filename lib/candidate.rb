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
    ux_count = applicants.select {|applicant| is_ux(applicant) }.length
    consultant_count = applicants.select {|applicant| is_consultant(applicant) }.length
    devops_count = applicants.select {|applicant| is_devops(applicant) }.length

    return {"artisans"=>artisans_count, "delivery"=>delivery_count, "ux"=>ux_count, "consultants"=>consultant_count, "devops"=>devops_count}
  end

  def self.is_delivery(applicant)
    job_titles = ["Delivery Lead"]
    job_titles.include? applicant["job_title"]
  end

  def self.is_artisan(applicant)
    job_titles = ["Software Apprentice Developer", "Software Journeyman Developer", "Software Craftsman Developer"]
    job_titles.include? applicant["job_title"]
  end

  def self.is_ux(applicant)
    job_titles = ["Experience Architect (XA)"]
    job_titles.include? applicant["job_title"]
  end

  def self.is_consultant(applicant)
    job_titles = ["Executive Consultant"]
    job_titles.include? applicant["job_title"]
  end

  def self.is_devops(applicant)
    job_titles = ["DevOps Journeyman (DevOps Engineer)"]
    job_titles.include? applicant["job_title"]
  end


end
