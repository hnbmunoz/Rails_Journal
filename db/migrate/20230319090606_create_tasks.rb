class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.integer :account_ID
      t.integer :category_ID
      t.string :title
      t.text :details
      t.datetime :created
      t.datetime :deadline      
    end
  end
end
