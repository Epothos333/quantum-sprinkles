class Candidate

  API_KEY = 'D9PNCCQl8ZtdF7zjtGksn2h4x2jZltP5'
  API_BASE_URL = 'https://api.resumatorapi.com/v1/'

  def self.total
    json_result = RestClient.get("#{API_KEY}applicants?apikey=#{API_BASE_URL}")
    JSON.parse(json_result).length
  end
end
