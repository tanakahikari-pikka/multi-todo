class Category < ApplicationRecord
  has_many :lists, dependent: :destroy
  accepts_nested_attributes_for :lists, allow_destroy: true

  validates_presence_of :name
end
