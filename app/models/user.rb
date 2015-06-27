class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, 
  # :recoverable, :registerable and :omniauthable
  devise :database_authenticatable, :validatable
end
