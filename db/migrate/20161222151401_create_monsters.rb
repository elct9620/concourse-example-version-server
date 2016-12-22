class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :hp
      t.integer :mp
      t.references :version, foreign_key: true

      t.timestamps
    end
  end
end
