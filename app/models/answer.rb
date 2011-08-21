class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :job
  
  def job
    question.job
  end
  
  def to_s
    answer
  end
end
