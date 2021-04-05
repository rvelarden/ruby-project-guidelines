class CreateMusicians < ActiveRecord::Migration[6.1]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :genre
      t.string :instrument
      t.float :price
      t.string :city
      t.boolean :active
      t.integer :rating  
    end
  end
end
