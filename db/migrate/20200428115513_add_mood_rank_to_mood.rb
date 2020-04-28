class AddMoodRankToMood < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :mood_rank, :integer
  end
end
