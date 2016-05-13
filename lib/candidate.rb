class Candidate

  API_KEY = ENV['JAZZ_KEY']
  API_BASE_URL = 'https://api.resumatorapi.com/v1/'

  def self.total
    json_result = RestClient.get("#{API_BASE_URL}applicants?apikey=#{API_KEY}")
    JSON.parse(json_result).length
  end
end
