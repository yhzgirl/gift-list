class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :occasion

      t.timestamps
    end
  end
end
