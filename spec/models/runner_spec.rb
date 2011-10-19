require 'spec_helper'

describe Runner do

  it "validates the numericality of time" do
    runner = Runner.new(:name => "hey", :time => "invalid")
    runner.should_not be_valid
  end

  it "can create a valid entry" do
    runner = Runner.create(:name => "Dave", :time => 14.53)
    runner.should be_valid
    runner.number.should == 1
  end

  it "orders runners by time in ascending order" do
    runner3 = Runner.create(:name => "Numba 3 Losa", :time => 34567.54)
    runner1 = Runner.create(:name => "Numba 1 Stunna", :time => 1.01)
    runner2 = Runner.create(:name => "Numba 2 Runna Upa", :time => 343.34)

    runners = Runner.all
    runners[0].should == runner1
    runners[1].should == runner2
    runners[2].should == runner3
  end

  it "Assigns the lowest available number" do
    runner1 = Runner.create(:name => "Sebastian")
    runner1.number.should == 1

    runner2 = Runner.create(:name => "Orlando Bloom")
    runner2.number.should == 2
    runner2.destroy

    runner3 = Runner.create(:name => "Brad Pitt")
    runner3.number.should == 2

  end

  it "parses runners from a text are" do
    Runner.create_runners_from_string "Dave\nKevin\n"

    dave = Runner.find_by_name("Dave")
    dave.should_not be_nil
    dave.number.should == 1

    kevin = Runner.find_by_name("Kevin")
    kevin.should_not be_nil
    kevin.number.should == 2
  end

end
