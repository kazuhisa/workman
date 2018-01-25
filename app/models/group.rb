class Group < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, presence: true
  accepts_nested_attributes_for :users, reject_if: ->(v){ v['name'].blank? && v['age'].blank? }, allow_destroy: true
end
