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

    artisans_count = applicants.select {|applicant| applicant["job_title"] == "Software Journeyman Developer" || applicant["job_title"] == "Software Craftsman Developer" }.length

    delivery_count = applicants.select {|applicant| applicant["job_title"] == "Delivery Lead"}.length

    return {"artisans"=>artisans_count, "delivery"=>delivery_count}
  end

end
