class AddJournalIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :journal_ID, :integer
  end
end
