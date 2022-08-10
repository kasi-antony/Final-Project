class ManagerJobsController < ApplicationController
    # here i will have adding and listing jobs

    layout "application"

    def new_job
        @job_list =  Job.new
    end

    def manager_add_job
        @job_list = Job.new( job_list_params )
        @job_list.user_id = @current_user.id
        if @job_list.save
            redirect_to manager_home_path
        end
    end

    def add_jobs
        @jobs = Job.where(user_id: @current_user.id)
    end
    def manager_home_page

    end

    private
    def job_list_params 
        params.require(:job_list).permit(:hiring_manager_name, :eligibility, :job_title, :company_name, :about_job, :qualification, :country)
    end
end
