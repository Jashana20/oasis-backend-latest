class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :journal_entry
      t.integer :user_id
      t.integer :mood_id

      t.timestamps
    end
  end
end
