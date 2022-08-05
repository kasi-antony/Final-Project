class UserJobsController < ApplicationController
    @@job_id
    def user_home
    end
    def user_job_details
        @job_id = job_id_returner
        @job = Job.find(@job_id)
    end
    def user_list_jobs
    end
    def job_id
        @@job_id = params[:id]
        redirect_to "/user_jobs/user_job_details"
    end
    def job_id_returner
        return @@job_id
    end
end
