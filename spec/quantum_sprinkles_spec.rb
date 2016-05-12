require File.expand_path '../spec_helper.rb', __FILE__
require 'rest-client'

describe 'Quantum Sprinkles Application' do
  it 'should show quantum sprinkles' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Quantum Sprinkles'
  end

  it 'should show the count from Jazz' do

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
        "id": "prospect_20160512182822_TKPWIHRLRGFGEQCU",
        "first_name": "Harry",
        "last_name": "Potter",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181011_4ZHR7DSN1ZIHLYSQ",
        "job_title": "Software Journeyman Developer"
    }]'

#    rest_double = class_double(RestClient)
    expect(RestClient).to receive(:get) { json_result }

    candidate_count = 2
    # setup a fake api that returns 2 candidates
    get '/'
    expect(last_response.body).to include "Total: #{candidate_count}"
  end
end
