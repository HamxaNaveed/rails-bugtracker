class Project < ApplicationRecord
  validates :name, :qa_id, presence: true
  validates :developer_ids, presence: { message: "Project must have developers" } 


  has_many :fixes, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :developers, class_name: 'User', foreign_key: 'developer_id', through: :user_projects

  accepts_nested_attributes_for :developers


  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :qa, class_name: 'User', foreign_key: 'qa_id'



end
