class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipment

  with_options presence: true do
    validates :image
    validates :name
    validates :product_detail
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :postage_id
      validates :prefecture_id
      validates :shipment_id
    end
    validates :price,
    format: { with: /\A[a-z0-9]+\z/i },
    numericality: { greater_than_or_equal_to:300, less_than_or_equal_to:9999999 }
  end
end
