class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories

  mount_uploader :picture, PictureUploader

  validates_presence_of :name, :price
  validates_numericality_of :price

  def self.search(search)
    if search
      where('name ILIKE :value OR description ILIKE :value', value: "%#{search}%")
    else
      all
    end
  end
end
