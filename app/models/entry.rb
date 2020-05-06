class Entry < ApplicationRecord
    belongs_to :user
    belongs_to :mood
    has_many :answers
    validates :journal_entry, {
        presence: true
    }
end
