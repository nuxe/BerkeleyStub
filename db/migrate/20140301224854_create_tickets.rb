class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :seat
      t.string :price
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
    end
  end
end
