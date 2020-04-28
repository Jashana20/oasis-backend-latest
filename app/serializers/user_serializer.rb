class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :id
  has_many :entries
end
