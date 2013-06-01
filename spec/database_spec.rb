require 'spec_helper'

describe Database do

  before(:each) do 
    @json = {"users"=>[{"username"=>"bigs", "password"=>"1234"}, {"username"=>"nessa", "password"=>"4567"}]}
    @data_object = [{"name"=>"users", "users"=>[{"columns"=>["username", "password"], "values"=>["bigs", "1234"]}, {"columns"=>["username", "password"], "values"=>["nessa", "4567"]}]}]
    @database = Database.new
  end

  context '#create_tables' do

    context 'creating sqlite table' do

      it 'should call execute on database' do
        @database.stub(:parse_columns)
        @database.stub(:insert_column_names)
        @database.stub(:read_table)
        @database.db.should_receive(:execute)
        @database.create_tables(@data_object)
      end

    end

  end

  context '#parse_columns' do

    context 'setting format for sqlite columns' do

      it 'should append varchar(100) on all columns' do
        @database.parse_columns('users', @data_object.first).should == "username varchar(100), password varchar(100)"
      end

    end

  end

end
