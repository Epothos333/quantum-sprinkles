require File.expand_path '../spec_helper.rb', __FILE__

describe 'Quantum Sprinkles Application' do
  it 'should show quantum sprinkles' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include 'Quantum Sprinkles'
  end
end
