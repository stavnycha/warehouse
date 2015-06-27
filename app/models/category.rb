class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates_presence_of :name

  def self.search(search)
    if search
      where('name ILIKE :value', value: "%#{search}%")
    else
      all
    end
  end
end
