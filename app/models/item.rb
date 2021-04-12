class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    with_options numericality: { other_than: 0, message: 'select' } do
      validates :category_id
      validates :condition_id, format: { with: /\A[0-9]+\z/, message: 'half-width number' }
      validates :shipping_fee_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, numericality: { only_integer: true, message: 'half-width number' }
  end
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
end
