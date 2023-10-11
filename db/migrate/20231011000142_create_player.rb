class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :name
      t.string :position
      t.integer :age
      t.boolean :retired

      t.timestamps
    end
  end
end
