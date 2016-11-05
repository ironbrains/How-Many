module Posts
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :email

    has_many :accounts
  end
end
