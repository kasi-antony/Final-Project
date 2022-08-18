# frozen_string_literal: true

class ManagerJobsController < ApplicationController
  # here i will have adding and listing jobs

  layout 'application'

  def new_job
    @job_list = Job.new
  end

  def manager_add_job
    @job_list = Job.new(job_list_params)
    @job_list.user_id = @current_user.id
    redirect_to '/manager_jobs/add_jobs' if @job_list.save
  end

  def remove_job
    @del = Job.find(params[:id])
    redirect_to '/manager_jobs/add_jobs' if @del.destroy
  end

  def add_jobs
    @jobs = Job.where(user_id: @current_user.id)
  end

  def manager_home_page; end

  def applicants
    @applied_jobs = Job.select('jobs.*,applicants_details.*')
                       .joins('JOIN applicants_details on jobs.id = applicants_details.job_id')
                       .where(user_id: @current_user.id)
    p '==================================================='
    p '==================================================='
    p '==================================================='
    p @applied_jobs
  end

  private

  def job_list_params
    params.require(:job_list).permit(:hiring_manager_name, :eligibility, :job_title, :company_name, :about_job,
                                     :qualification, :country)
  end
end
