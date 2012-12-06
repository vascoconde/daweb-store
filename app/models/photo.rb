class Photo < ActiveRecord::Base
  attr_accessible :description, :url

  belongs_to :product
end
