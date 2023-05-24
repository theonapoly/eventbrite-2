class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :participations, class_name:'Attendance'
  has_many :events, through: :participations
  has_many :admins, class_name: 'Event', foreign_key:'admin_id'

end
