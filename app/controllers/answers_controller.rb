class AnswersController < ApplicationController
  
  def list
    @job = Job.find(params[:job_id], :include => :answers)
    @answer = @job.answers.find.all
  end
  
  def index
    @answers = Answer.all(:order => 'created_at DESC', :limit => 10)
  end

  def show
    @job = Job.find(params[:job_id], :include => :answers)
    @answer = @job.answers.find(params[:id])
  end

  def new
    @job = Job.find(params[:job_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def create
    job = Job.find(params[:job_id])
     
    params[:answers].each do |question_id, answer_text|
      next if answer_text.blank?
      question = Question.find(question_id)
      question.answers.create!(:answer => answer_text)
    end
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to(@answer, :notice => 'Answer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @answer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(answers_url) }
      format.xml  { head :ok }
    end
  end
end


# @job = current_user.jobs.find(params[:job_id])
# @answer = @job.answers
# end
