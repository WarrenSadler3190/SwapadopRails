class Item < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  searchable do
    text :title
  end
end
