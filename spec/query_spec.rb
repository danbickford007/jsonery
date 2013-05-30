require 'spec_helper'
require 'query'
describe Query do 

  before(:all) do
    @query = Query.new
  end

  context 'get json from file and parse' do

    it 'should return parse json from file' do
      @query.get_json.should == @data
    end

  end

end
