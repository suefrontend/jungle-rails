class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true # error message automatically generated
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  # errors.add :name, message: "Name can't be blank"
end
