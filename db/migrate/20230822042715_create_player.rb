class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :salary
      t.string :position
      t.boolean :injured
      t.bigint :team_id

      t.timestamps
    end
  end
end
