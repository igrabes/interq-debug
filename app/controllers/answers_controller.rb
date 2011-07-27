class AnswersController < ApplicationController
  # GET /answers
  # GET /answers.xml
  def index
    @answers = Answer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @answers }
    end
  end

  GET /answers/1
  GET /answers/1.xml
  def show
        @job = Job.find(params[:id])
  #       @question = @job.questions.find(params[:id])
  #       @answer = @question.answers.find(params[:id])
  #         
  # 
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.xml  { render :xml => @answer }
  #     end
    end

  # GET /answers/new
  # GET /answers/new.xml
  def new
    @job = Job.find(params[:job_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = Answer.find(params[:id])
  end

  # POST /answers
  # POST /answers.xml
  def create
    @job = Job.find(params[:job_id])
    
    # count = 0

    params[:answers].each do |question_id, answer_text|
      next if answer_text.blank?
      question = Question.find(question_id)
      question.answers.create!(:answer => answer_text)
      # count += 1
    end

    # raise "I created #{count} Answers!"
    redirect_to job_answers_path(@job_id)
  end

  # PUT /answers/1
  # PUT /answers/1.xml
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

  # DELETE /answers/1
  # DELETE /answers/1.xml
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to(answers_url) }
      format.xml  { head :ok }
    end
  end
end
