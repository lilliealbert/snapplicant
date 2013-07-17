class CreateJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.text :source_url
      t.text :description
      t.text :notes
    end
  end
end
