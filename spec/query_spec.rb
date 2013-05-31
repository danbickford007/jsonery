require 'spec_helper'
describe Query do 

  before(:all) do
    @query = Query.new
    @query.stub(:gets).and_return('select * from users;')
  end

  context 'get json from file and parse' do

    it 'should return json from file' do
      @query.get_json.should_not be_nil
    end

  end

end
