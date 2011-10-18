class Runner < ActiveRecord::Base
  validates_presence_of :name, :number
  validates :number, :time, :numericality => true
  default_scope :order => "time ASC"
end
