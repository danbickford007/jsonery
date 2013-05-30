require 'spec_helper'

describe Iterator do

  before(:each) do
    @iterator = Iterator.new
  end

  context 'checking format of current node in json' do

    it 'should call array method if json node is an array' do
      @iterator.should_receive(:array)
      @iterator.iterate([])
    end

    it 'should call hash method if json node is a hash' do
      @iterator.should_receive(:hash)
      @iterator.iterate({})
    end

  end

end
