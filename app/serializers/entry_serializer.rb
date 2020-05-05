class EntrySerializer < ActiveModel::Serializer
  attributes :id, :journal_entry, :mood_id
  belongs_to :mood
  has_many :answers
end
