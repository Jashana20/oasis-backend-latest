class User < ApplicationRecord
    has_many :entries
    has_secure_password
    validates :username, {
        presence: true,
        uniqueness: true,
        length: {in: 3..8},
        case_sensitive: false
    }
    validates :email, {
        presence: true
    }
end
