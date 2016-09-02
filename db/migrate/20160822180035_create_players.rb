class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :health, default: 20
      t.boolean :is_human?, default: false
      t.boolean :is_active?, default: false
      t.boolean :is_winner?, default: false

      t.belongs_to :game

      t.timestamps
    end
  end
end
