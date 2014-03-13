class Item < ActiveRecord::Base
  belongs_to :user
  has_many :offers
  mount_uploader :image, ImageUploader

  searchable do
    text :title
  end
end
