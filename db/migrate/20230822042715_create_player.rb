class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :name
      t.integer :salary
      t.string :position
      t.boolean :injured

      t.timestamps
    end
  end
end
