class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates :name, uniqueness: true, presence: true

  def self.search(search)
    if search
      where('name ILIKE :value', value: "%#{search}%")
    else
      all
    end
  end
end
