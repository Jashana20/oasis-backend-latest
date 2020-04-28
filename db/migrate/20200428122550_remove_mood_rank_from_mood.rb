class RemoveMoodRankFromMood < ActiveRecord::Migration[6.0]
  def change

    remove_column :moods, :mood_rank, :integer
  end
end
