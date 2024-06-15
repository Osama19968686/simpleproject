class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects
  has_one_attached :profile_picture
  enum user_type: { manager: 0, developer: 1, qa: 2 }
  has_many :assigned_bugs, class_name: 'Bug', foreign_key: 'assigned_to_id'
end
