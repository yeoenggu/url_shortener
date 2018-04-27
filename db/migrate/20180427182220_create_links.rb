class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :full_url
      t.string :slug
      t.integer :clicks

      t.timestamps
    end
  end
end
