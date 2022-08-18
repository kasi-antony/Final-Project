# frozen_string_literal: true

$list_jobs = nil
class UserJobsController < ApplicationController
  @@array = []
  @@presence_value = 0

  def search
    @parameter = params[:search]
    @@array = []
    @results = Job.where('company_name LIKE?', "%#{@parameter}%")
    @@presence_value = 1
    @results.each do |result|
      @@array.push(result.id)
      puts result.company_name
    end
    redirect_to '/user_jobs/user_list_jobs'
  end

  def array_returner
    @@array
  end

  def presence_value_returner
    @@presence_value
  end

  @@job_id
  def user_home; end

  def user_list_jobs
    @search_details = Job.all
    @presence = 0
    @presence_value = presence_value_returner
    @search_params = array_returner
    @presence = 1 if @search_params == []
    @@array = []
    @@presence_value = 0
  end

  def job_id
    @job = Job.find(params[:id])
    render 'user_job_details'
  end

  def applicants_form
    @job = Job.find(params[:id])
  end

  def job_id_returner
    @@job_id
  end

  def applicants
    applicants = ApplicantsDetail.new
  end

  def applicants_details
    applicants = ApplicantsDetail.new(applicants_details_params)
    applicants.user_id = @current_user.id
    applicants.job_id = params[:id]
    if applicants.save
      redirect_to '/homes/index'
    else
      render plain: 'fialed'
    end
  end

  private

  def applicants_details_params
    params.require(:applicants_details).permit(:applicant_name, :alternate_mobile, :address, :experience, :education)
  end
end
