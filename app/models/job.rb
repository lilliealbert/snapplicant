class Job < ActiveRecord::Base
  belongs_to :user
  validates :title, :company, presence: true

  attr_accessible :title, :company, :source_url, :description, :notes, :status, :archived

  def is_status?(a_status)
    self.status == a_status
  end

  def self.statuses
    %w(possible preparing submitted interviewing offered rejected)
  end
end