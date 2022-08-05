class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :hiring_manager_name
      t.string :eligibility
      t.string :job_title
      t.string :company_name
      t.text :about_job
      t.string :qualification
      t.string :country

      t.timestamps
    end
  end
end
