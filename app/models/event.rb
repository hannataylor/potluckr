class Event < ActiveRecord::Base
  belongs_to :host, :class_name => "User"

  has_many :invites, :foreign_key => "attended_event_id"
  has_many :attendees, :through => :invites
  has_many :items

  has_many :comments, as: :commentable

  scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
  scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }

end
