require 'spec_helper'

describe Runner do

  it "validates the numericality of minutes and seconds" do
    runner = Runner.new(:name => "hey", :minutes => "invalid", :seconds => "invalid")
    runner.should_not be_valid
  end

  it "can create a valid entry" do
    runner = Runner.create(:name => "Dave", :minutes => 43, :seconds => 14.53)
    runner.should be_valid
    runner.number.should == 1
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
