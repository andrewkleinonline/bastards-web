class CreateHands < ActiveRecord::Migration[5.0]
  def change
    create_table :hands do |t|
      t.belongs_to :player, foreign_key: true
      
      t.timestamps
    end
  end
end
