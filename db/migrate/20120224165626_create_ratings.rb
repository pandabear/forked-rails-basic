class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :book
      t.string :email
      t.integer :rate

      t.timestamps
    end
    
    add_index :ratings, :book_id
  end
end
