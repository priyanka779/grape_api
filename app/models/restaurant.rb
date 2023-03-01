class Restaurant < ApplicationRecord
  has_many :items
  belongs_to :location
end
