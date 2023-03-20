class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :account_ID      
      t.string :title
      t.text :annotations
    end
  end
end
