class Runner < ActiveRecord::Base
  validates_presence_of :name
  validates :time, :numericality => true, :allow_nil => true

  default_scope :order => "time ASC"

  after_create :set_runner_number

  def self.create_runners_from_string runner_list
    runners = CSV.parse(runner_list).flatten
    runners.each do |runner|
      Runner.create(:name => runner)
    end
  end

  private

  def get_runner_number
    next_number = 1
    while(Runner.find_by_number(next_number))
      next_number += 1
    end
    return next_number
  end

  def set_runner_number
    update_attributes(:number => get_runner_number)
  end

end
