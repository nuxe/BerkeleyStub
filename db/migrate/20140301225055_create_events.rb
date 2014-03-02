class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.timestamp :date
      t.timestamps
    end
  end
end
