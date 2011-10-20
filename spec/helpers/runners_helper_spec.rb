require 'spec_helper'

describe RunnersHelper do

  it "orders runners by time in ascending order" do
    runner3 = Runner.create(:name => "Numba 3 Losa", :minutes => 5, :seconds => 47.54)
    runner1 = Runner.create(:name => "Numba 1 Stunna", :minutes => 3, :seconds => 1.01)
    runner2 = Runner.create(:name => "Numba 2 Runna Upa", :minutes => 5, :seconds => 43.34)

    runners = sort_by_time(Runner.all)
    runners[0].should == runner1
    runners[1].should == runner2
    runners[2].should == runner3
  end

end
