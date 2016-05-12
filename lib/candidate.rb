class Candidate
  def self.total
    json_result = RestClient.get("https://api.resumatorapi.com/v1/applicants?apikey=D9PNCCQl8ZtdF7zjtGksn2h4x2jZltP5")
    JSON.parse(json_result).length
  end
end
