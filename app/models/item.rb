class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :status
  belongs_to :Postage
  belongs_to :prefecture
  belongs_to :shipment
end
