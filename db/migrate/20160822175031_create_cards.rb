class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :deck, foreign_key: true
      t.belongs_to :hand, foreign_key: true
      t.belongs_to :trash, foreign_key: true

      t.integer :power
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
