class CreateTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :budget
      t.string :location
      t.boolean :relegated

      t.timestamps
    end
  end
end
