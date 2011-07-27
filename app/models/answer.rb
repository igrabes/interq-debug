class Answer < ActiveRecord::Base
  belongs_to :question
  
  def job
    question.job
  end
end
