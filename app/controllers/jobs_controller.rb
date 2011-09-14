class JobsController < ApplicationController

  before_filter :current_user_nil, :except => [:sort]   
  before_filter :authorize, :except => [:index, :sort]  
  

  def index
    @jobs = Job.order('jobs.position ASC')
    @tag = Tag.find(params[:tag_id]) if params[:tag_id]
          if params[:search].blank?
            @jobs = (@tag ? @tag.jobs : Job.order('jobs.position ASC'))
          else
            @jobs = Job.search_published(params[:search], params[:tag_id])
          end

    respond_to do |format|
      format.html { @jobs = @jobs.paginate(:page => params[:page], :per_page => jobs_per_page) }
      format.rss
    end 
  end
  
  def sort
    @jobs = Job.all
    @jobs.each do |job|
      job.position = params['job'].index(job.id.to_s) + 1
      job.save
    end
    
    render :nothing => true  
  end


  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  
  def new
    @job = Job.new
    10.times do
     question = @job.questions.build
   end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

 
  def edit
    @job = Job.find(params[:id])
  end


  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def jobs_per_page
    case params[:view]
    when "list" then 40
    when "grid" then 24
    else 10
    end  
  end

end
