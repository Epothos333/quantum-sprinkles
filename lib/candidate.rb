class Candidate

  API_KEY = ENV['JAZZ_KEY']
  API_BASE_URL = 'https://api.resumatorapi.com/v1/'

  def self.total
    get_jazz_applicants.length
  end

  def self.get_family_totals
    applicants = get_jazz_applicants
    get_totals_from_applicants(applicants)
  end

  def self.get_family_totals_by_region(region_name)
    api_location = "jobs"
    jobs = call_jazz_api(api_location)
    applicants = get_jazz_applicants

    state_name = get_state_name_from_region_name region_name

    this_regions_jobs = jobs.select{|job| job["state"] == state_name}
    this_regions_job_ids = this_regions_jobs.map{|job| job["id"]}

    this_regions_applicants = applicants.select{|applicant| this_regions_job_ids.include? applicant["job_id"]}

    get_totals_from_applicants this_regions_applicants
  end

  def self.get_state_name_from_region_name(region_name)
    case region_name
      when 'OVR'
        'OH'
      when 'IHR'
        'IA'
      when 'GLR'
        'MI'
      else
        nil
    end
  end

  private

  def self.get_totals_from_applicants(applicants)
    artisans_count = applicants.select { |applicant| is_artisan(applicant) }.length
    delivery_count = applicants.select { |applicant| is_delivery(applicant) }.length
    ux_count = applicants.select { |applicant| is_ux(applicant) }.length
    consultant_count = applicants.select { |applicant| is_consultant(applicant) }.length
    devops_count = applicants.select { |applicant| is_devops(applicant) }.length

    {"artisans" => artisans_count, "delivery" => delivery_count, "ux" => ux_count, "consultants" => consultant_count, "devops" => devops_count}
  end

  def self.get_jazz_applicants
    api_location = "applicants"
    call_jazz_api(api_location)
  end

  def self.call_jazz_api(api_location)
    json_result = RestClient.get("#{API_BASE_URL}#{api_location}?apikey=#{API_KEY}")
    JSON.parse(json_result)
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
