require 'spec_helper'

describe Admin do

  it "validates presence of username" do
    admin1 = Admin.new(:password => "OOOOOOOOOO YEEEEEEAAAAAA")
    admin1.should_not be_valid
  end

  it "validates presence of password" do
    admin1 = Admin.new(:username => "Randy Macho Man Savage")
    admin1.should_not be_valid
  end

end
