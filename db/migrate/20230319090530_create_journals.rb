class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.integer :account_ID
      t.string :journal_name
      t.string :hex
    end
  end
end
