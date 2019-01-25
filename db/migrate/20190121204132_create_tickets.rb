class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :seat_id_seq
      t.text :address
      t.decimal :price
      t.string :email_address
      t.string :phone

      t.timestamps
    end
  end
end
