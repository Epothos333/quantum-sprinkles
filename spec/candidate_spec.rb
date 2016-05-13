require File.expand_path '../spec_helper.rb', __FILE__
require 'rest-client'

describe 'Candidate' do
  before(:each) do
    candidate_json_result = '[
    {
        "id": "prospect_20160513152410_WUEGUJS8TFT8VNTR",
        "first_name": "Steven",
        "last_name": "Stevenson",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-13",
        "job_id": "job_20160513151834_OTSLF01TKSHFNRUF",
        "job_title": "Executive Consultant"
      },
      {
        "id": "prospect_20160513152237_G5ARPJIUMGPBBVYM",
        "first_name": "David",
        "last_name": "Davidson",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-13",
        "job_id": "job_20160513152056_RGO5OTAXTLSTCTMH",
        "job_title": "Experience Architect (XA)"
      },
      {
        "id": "prospect_20160513152138_3UEWSVGMHQMRYQAG",
        "first_name": "Bob",
        "last_name": "Bobson",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-13",
        "job_id": "job_20160513152017_CX4GTCWXERY4H6PF",
        "job_title": "DevOps Journeyman (DevOps Engineer)"
      },
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
        "id": "prospect_20160512181705_YNLVMB6DTBIDR9PT",
        "first_name": "Bugs",
        "last_name": "Bunny",
        "prospect_phone": "2345678910",
        "apply_date": "2016-05-12",
        "job_id": "job_20160512181510_NQZY56GMKYSDJC0K",
        "job_title": "Software Craftsman Developer"
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

    @jobs_json_result = '[
        {
            "id": "job_20160513151834_OTSLF01TKSHFNRUF",
            "team_id": "",
            "title": "Executive Consultant",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "12345",
            "department": "",
            "description": "Description",
            "minimum_salary": "1",
            "maximum_salary": "2",
            "notes": "",
            "original_open_date": "2016-05-13",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511132222_QLIBROB6ILNWD5ZO",
            "board_code": "ramuQH",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160513152017_CX4GTCWXERY4H6PF",
            "team_id": "",
            "title": "DevOps Journeyman (DevOps Engineer)",
            "country_id": "United States",
            "city": "Columbus",
            "state": "OH",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-13",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "hyuMhV",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160513152056_RGO5OTAXTLSTCTMH",
            "team_id": "",
            "title": "Experience Architect (XA)",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-13",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "OXfLFM",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512180517_FJVQSTNDM7VFEECF",
            "team_id": "",
            "title": "Software Journeyman Developer",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "59ypan",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181011_4ZHR7DSN1ZIHLYSQ",
            "team_id": "",
            "title": "Software Journeyman Developer",
            "country_id": "United States",
            "city": "Columbus",
            "state": "OH",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "BEvScH",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181220_YM9DJVXNFZXDYD6E",
            "team_id": "",
            "title": "Software Journeyman Developer",
            "country_id": "United States",
            "city": "Ann Arbor",
            "state": "MI",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "zVml7O",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181345_2FU8Y06MK7JDGCD0",
            "team_id": "",
            "title": "Software Journeyman Developer",
            "country_id": "United States",
            "city": "Boulder",
            "state": "CO",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "yTiVu6",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181416_C2ZAFIUBO61DKFDA",
            "team_id": "",
            "title": "Software Craftsman Developer",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "V0Xwk4",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181446_2Z9H92KLGIVEZP8C",
            "team_id": "",
            "title": "Software Craftsman Developer",
            "country_id": "United States",
            "city": "Columbus",
            "state": "OH",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "zt41xr",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181510_NQZY56GMKYSDJC0K",
            "team_id": "",
            "title": "Software Craftsman Developer",
            "country_id": "United States",
            "city": "Ann Arbor",
            "state": "MI",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "cimhED",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181541_YS2XZXNXH0HK4I8Y",
            "team_id": "",
            "title": "Software Apprentice Developer",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "8UbLAG",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181608_OAT8XSOIYVSCXITR",
            "team_id": "",
            "title": "Software Apprentice Developer",
            "country_id": "United States",
            "city": "Columbus",
            "state": "OH",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "T4QkxX",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181645_RIIKZZJA72IITGWF",
            "team_id": "",
            "title": "Software Apprentice Developer",
            "country_id": "United States",
            "city": "Ann Arbor",
            "state": "MI",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "pV3aIg",
            "internal_code": "",
            "questionnaire": "0"
        },
        {
            "id": "job_20160512181717_RWV3UKQQHLGTGCEE",
            "team_id": "",
            "title": "Delivery Lead",
            "country_id": "United States",
            "city": "Des Moines",
            "state": "IA",
            "zip": "",
            "department": "",
            "description": "This is required",
            "minimum_salary": "0",
            "maximum_salary": "0",
            "notes": "",
            "original_open_date": "2016-05-12",
            "type": "Full Time",
            "status": "Open",
            "send_to_job_boards": "No answer",
            "hiring_lead": "usr_20160511131709_PZEHEMXY9AYAOTRS",
            "board_code": "LIRk82",
            "internal_code": "",
            "questionnaire": "0"
        }
    ]'


    expect(RestClient).to receive(:get).with(/applicants/) { candidate_json_result }
  end

  it 'should return totals by job family' do
    family_totals = Candidate.get_family_totals
    expect(family_totals["artisans"]).to eq 4
    expect(family_totals["delivery"]).to eq 1
    expect(family_totals["ux"]).to eq 1
    expect(family_totals["consultants"]).to eq 1
    expect(family_totals["devops"]).to eq 1
  end

  it 'should return job family totals by OVR region' do
    expect(RestClient).to receive(:get).with(/jobs/) { @jobs_json_result }
    region_family_totals = Candidate.get_family_totals_by_region 'OVR'
    expect(region_family_totals["artisans"]).to eq 0
    expect(region_family_totals["delivery"]).to eq 1
    expect(region_family_totals["ux"]).to eq 0
    expect(region_family_totals["consultants"]).to eq 0
    expect(region_family_totals["devops"]).to eq 1
  end

  it 'should return job family totals by IHR region' do
    expect(RestClient).to receive(:get).with(/jobs/) { @jobs_json_result }
    region_family_totals = Candidate.get_family_totals_by_region 'IHR'
    expect(region_family_totals["artisans"]).to eq 3
    expect(region_family_totals["delivery"]).to eq 0
    expect(region_family_totals["ux"]).to eq 1
    expect(region_family_totals["consultants"]).to eq 1
    expect(region_family_totals["devops"]).to eq 0
  end

  it 'should not allow invalid regions' do
    expect(RestClient).to receive(:get).with(/jobs/) { @jobs_json_result }
    region_family_totals = Candidate.get_family_totals_by_region 'LER' #land of enchantment region ;)
    expect(region_family_totals["artisans"]).to eq 0
    expect(region_family_totals["delivery"]).to eq 0
    expect(region_family_totals["ux"]).to eq 0
    expect(region_family_totals["consultants"]).to eq 0
    expect(region_family_totals["devops"]).to eq 0
  end

  it 'should return job family totals by GLR region' do
    expect(RestClient).to receive(:get).with(/jobs/) { @jobs_json_result }
    region_family_totals = Candidate.get_family_totals_by_region 'GLR'
    expect(region_family_totals["artisans"]).to eq 1
    expect(region_family_totals["delivery"]).to eq 0
    expect(region_family_totals["ux"]).to eq 0
    expect(region_family_totals["consultants"]).to eq 0
    expect(region_family_totals["devops"]).to eq 0
  end

end
