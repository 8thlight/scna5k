class RunnersController < ApplicationController
  def index
    @runners = Runner.all
  end
end
