require 'spec_helper'
require 'query'
describe Query do 

  before(:all) do
    @query = Query.new
    #@query.stub(:gets).and_return('test')
  end

  context 'get json from file and parse' do

    it 'should return parse json from file' do
      puts "?>?>?>?>?>?>?>"
      puts @query.inspect
      @query.get_json.should == @data
    end

  end

end
