class Item < ApplicationRecord
  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id , presence: true
  validates :fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_date_id, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true
end
