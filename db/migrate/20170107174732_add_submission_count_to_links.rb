class AddSubmissionCountToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :submission_count, :integer, :default => 0
  end
end
