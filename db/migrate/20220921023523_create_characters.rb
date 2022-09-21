class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :combat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :initiative
      t.integer :wound
      t.integer :onslaught
      t.boolean :acted

      t.timestamps
    end
  end
end
