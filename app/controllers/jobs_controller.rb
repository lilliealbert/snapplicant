class JobsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :index

  def index
    @active_jobs = current_user.jobs.where(archived: false) if user_signed_in?
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

  def archived
    @archived_jobs = current_user.jobs.where(archived: true)
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update_attributes(params[:job])
      render :show
    else
      flash.now[:errors] = @job.errors.full_messages
      render :edit
    end
  end
end