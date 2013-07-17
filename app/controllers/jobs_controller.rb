class JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    @job.status = "possible"
    @job.archived = false
    if @job.save
      redirect_to root_path
    else
      flash.now[:errors] = @job.errors.full_messages
      render :new
    end
  end
end