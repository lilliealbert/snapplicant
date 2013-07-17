class AddJobStatusesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :status, :string
    add_column :jobs, :archived, :boolean
  end
end
