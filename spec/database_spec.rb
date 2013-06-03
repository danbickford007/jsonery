require 'spec_helper'

describe Database do

  before(:each) do 
    @json = {"users"=>[{"username"=>"bigs", "password"=>"1234"}, {"username"=>"nessa", "password"=>"4567"}]}
    @data_object = {"name"=>"users", "users"=>[{"columns"=>["username", "password"], "values"=>["bigs", "1234"]}, {"columns"=>["username", "password"], "values"=>["nessa", "4567"]}]}
    @database = Database.new
  end

  context '#create_tables' do

    context 'creating sqlite table' do

      it 'should call execute on database' do
        @database.stub(:parse_columns)
        @database.stub(:insert_column_names)
        @database.stub(:read_table)
        @database.db.should_receive(:execute)
        @database.create_tables([@data_object])
      end

    end

  end

  context '#parse_columns' do

    context 'setting format for sqlite columns' do

      it 'should append varchar(100) on all columns' do
        @database.parse_columns('users', @data_object).should == "username varchar(100), password varchar(100)"
      end

    end

  end

  context '#parse_values' do

    context 'adding single string value format for sql insert' do

      it 'should find all values and surround with single quotes' do
        @database.parse_values('users', @data_object).should == ["'bigs','1234'", "'nessa','4567'"]
      end 

    end

  end

  context '#insert_column_names' do

    context 'inserting json mocked data into sql table' do

      it 'should receive execute on sql db' do
        @database.db.should_receive(:execute).at_least(2).times
        @database.insert_column_names('users', @data_object)
      end

      it 'should insert a proper sql insert statment' do
        @data = {"name"=>"users", "users"=>[{"columns"=>["username", "password"], "values"=>["bigs", "1234"]}]}
        @database.db.should_receive(:execute).at_least(1).times.with("INSERT INTO users (username,password) VALUES ('bigs','1234')")
        @database.insert_column_names('users', @data)
      end

    end

  end

  context '#pull_information' do

    context 'pulling information via sql' do

      it 'should puts to console 4 times' do
        @database.should_receive(:puts).exactly(4).times
        @database.pull_information("select * from users where id = 1")
      end

    end

  end

end
