class User < ApplicationRecord
  validates_presence_of :role_id, presence: { message: "User must have role" } 

  belongs_to :role
  has_many :projects, class_name: 'User', foreign_key: 'created_by_id'
  has_many :projects, class_name: 'User', foreign_key: 'qa_id'

  has_many :user_projects
  has_many :projects, foreign_key: 'developer_id', through: :user_projects

  has_many :fixes, foreign_key: 'assign_to_id', class_name: "User"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
