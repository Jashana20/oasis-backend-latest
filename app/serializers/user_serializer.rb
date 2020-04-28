class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :entries
end
