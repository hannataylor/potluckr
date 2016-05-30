class Item < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  has_many :comments, as: :commentable

  validates :name, presence: true
end
