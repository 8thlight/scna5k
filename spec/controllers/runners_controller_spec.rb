require 'spec_helper'

describe RunnersController do

  it "has an index page" do
    get "index"
    response.should be_success
  end
end
