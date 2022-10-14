class Fix < ApplicationRecord
  validates :name, :description, presence: true

  belongs_to :project
  has_one_attached :image

  belongs_to :assign_to, class_name: 'User', foreign_key: 'assign_to_id', optional: true
end
