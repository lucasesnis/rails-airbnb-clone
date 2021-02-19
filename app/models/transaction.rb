class Transaction < ApplicationRecord
  belongs_to :offer
  belongs_to :user

  validates_presence_of :date, on: :create, message: "can't be blank"
end
