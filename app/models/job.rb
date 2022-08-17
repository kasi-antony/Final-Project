# frozen_string_literal: true

class Job < ApplicationRecord
    has_many :applicants_details
end
