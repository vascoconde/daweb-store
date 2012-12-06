class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :manufacturer_id, :category_id
  has_many :reviews
  has_many :photos
  has_many :related_products, :class_name => "Product"

  belongs_to :category
  belongs_to :manufacturer

  validates :description, :name, :price, :manufacturer_id, :category_id,
              :presence => true
end
