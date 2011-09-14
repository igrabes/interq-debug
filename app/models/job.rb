class Job < ActiveRecord::Base
  acts_as_list
  
  has_many :questions
  has_many :answers, :through => :questions
  
  accepts_nested_attributes_for :questions
  accepts_nested_attributes_for :answers

end
