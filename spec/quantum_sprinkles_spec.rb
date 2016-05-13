require File.expand_path '../spec_helper.rb', __FILE__
require 'rest-client'

describe 'Quantum Sprinkles Application' do
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
        "id": "prospect_20160512182822_TKPWIHRLRGFGEQCU",
        "first_name": "Harry",
        "last_name": "Potter",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181011_4ZHR7DSN1ZIHLYSQ",
        "job_title": "Software Journeyman Developer"
    }]'
    expect(RestClient).to receive(:get).at_least(:once) { json_result }
  end

  it 'should have an ok response' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'should show the count from Jazz' do
    candidate_count = 2
    get '/'
    expect(last_response.body.strip).to include "<div class=\"col-md-2 col-sm-4 col-xs-6 tile_stats_count\">
              <span class=\"count_top\"><i class=\"fa fa-user\"></i> Total Candidates</span>
              <div class=\"count_bottom count\">#{candidate_count}</div>
            </div>".strip
  end
end
