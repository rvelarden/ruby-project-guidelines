class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.integer :musician_id
      t.integer :gig_id
    end
  end
end
