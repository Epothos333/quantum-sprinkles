require File.expand_path '../spec_helper.rb', __FILE__
require 'rest-client'

describe 'Candidate' do
  before(:each) do
    json_result = '[
      {
        "id": "prospect_20160512184407_MYXVB4IKB2IALSSA",
        "first_name": "Alan",
        "last_name": "Turing",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181416_C2ZAFIUBO61DKFDA",
        "job_title": "Software Craftsman Developer"
      }, 
      {
        "id": "prospect_20160512180935_YLU1DM1F2LVA80XF",
        "first_name": "Johnny",
        "last_name": "Appleseed",
        "prospect_phone": "234-567-8910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512180517_FJVQSTNDM7VFEECF",
        "job_title": "Software Journeyman Developer"
      }, 
      {
        "id": "prospect_20160512181803_UFGDGYCOYQPH48X2",
        "first_name": "George",
        "last_name": "Washington",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181541_YS2XZXNXH0HK4I8Y",
        "job_title": "Software Apprentice Developer"
      },
      {
        "id": "prospect_20160512182822_TKPWIHRLRGFGEQCU",
        "first_name": "Harry",
        "last_name": "Potter",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181011_4ZHR7DSN1ZIHLYSQ",
        "job_title": "Delivery Lead"
    }]'
    expect(RestClient).to receive(:get) { json_result }
  end

  it 'should return totals by job family' do
    family_totals = Candidate.get_family_totals
    expect(family_totals["artisans"]).to eq 3
    expect(family_totals["delivery"]).to eq 1
  end

end
