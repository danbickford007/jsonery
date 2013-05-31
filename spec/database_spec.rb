require 'spec_helper'

describe Database do

  before(:each) do 
    @json = {'users'=>[{'username'=>'bigs'}]}
    @database = Database.new
  end

  context 'transfering keys to tables' do

    it 'should create sqlite table from json' do
      @database.create_tables(@json).should == nil
    end

  end

end
