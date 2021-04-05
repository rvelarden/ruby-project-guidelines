class CreateGigs < ActiveRecord::Migration[6.1]
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :city
      t.float :pay
      t.string :category
      t.datetime :start_time
      t.datetime :end_time
    end
  end
end
