class Service < ApplicationRecord
    has_many :offers, class_name: "offer", foreign_key: "reference_id"
    has_one_attached :photo
end
