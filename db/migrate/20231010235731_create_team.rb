class CreateTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :year_founded
      t.boolean :former_champion

      t.timestamps
    end
  end
end
