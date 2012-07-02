require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  describe "GET /" do
    it 'should be ok' do
      get '/'
      last_response.should be_ok
    end    
  end
end