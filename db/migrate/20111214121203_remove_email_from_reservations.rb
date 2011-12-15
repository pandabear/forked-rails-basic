class RemoveEmailFromReservations < ActiveRecord::Migration
  def up
    remove_column :reservations, :email
  end

  def down
    add_column :reservations, :email, :string
  end
end
