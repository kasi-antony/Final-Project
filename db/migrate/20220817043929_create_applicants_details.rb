class CreateApplicantsDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants_details do |t|
      t.bigint :user_id
      t.bigint :job_id
      t.string :applicant_name
      t.bigint :alternate_mobile
      t.string :address
      t.string :experience
      t.string :education

      t.timestamps
    end
  end
end
