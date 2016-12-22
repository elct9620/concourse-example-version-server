class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.integer :major
      t.integer :minior
      t.text :description

      t.timestamps
    end
  end
end
