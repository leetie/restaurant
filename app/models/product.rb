class Product < ApplicationRecord
  has_one_attached :picture, dependent: :destroy
end
