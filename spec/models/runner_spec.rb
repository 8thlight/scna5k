require 'spec_helper'

describe Runner do

  it "validates the presence of name" do
    runner = Runner.new(:number => "33")
    runner.should_not be_valid
  end

  it "validates the presence of number" do
    runner = Runner.new(:name => "Dude")
    runner.should_not be_valid
  end

  it "validates the numericality of number" do
    runner = Runner.new(:name => "man", :number => "invalid")
    runner.should_not be_valid
  end

  it "validates the numericality of time" do
    runner = Runner.new(:name => "hey", :number => 2, :time => "invalid")
    runner.should_not be_valid
  end

  it "can create a valid entry" do
    runner = Runner.new(:name => "Dave", :number => 11, :time => 14.53)
  end

  it "orders runners by time in ascending order" do
    runner3 = Runner.create(:name => "Numba 3 Losa", :number => 9, :time => 34567.54)
    runner1 = Runner.create(:name => "Numba 1 Stunna", :number => 3, :time => 1.01)
    runner2 = Runner.create(:name => "Numba 2 Runna Upa", :number => 1, :time => 343.34)

    runners = Runner.all
    runners[0].should == runner1
    runners[1].should == runner2
    runners[2].should == runner3
  end
end
