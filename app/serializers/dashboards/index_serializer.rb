module Dashboards
  class IndexSerializer < ActiveModel::Serializer
    attributes :total

    has_many :accounts

    def total
      object.accounts.sum :balance
    end
  end
end
