class CreateTrashes < ActiveRecord::Migration[5.0]
  def change
    create_table :trashes do |t|
      t.belongs_to :game
      t.timestamps
    end
  end
end
