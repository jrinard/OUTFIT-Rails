class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :pictures
         has_many :events, through: :pictures
        # has_many :events, through: :pictures, dependent: :destroy

end
