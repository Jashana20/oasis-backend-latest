class AddEntryIdToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :entry_id, :integer
  end
end
