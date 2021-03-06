class User < ActiveRecord::Base
  has_many :events, :foreign_key => :host_id

  has_many :invites, :foreign_key => :attendee_id
  has_many :attended_events, :through => :invites
  has_many :comments, as: :commentable
  has_many :items


  validates :username, presence: true
  validates :username, :email, uniqueness: true

  has_secure_password

  def upcoming_events
    self.attended_events.upcoming
  end

  def previous_events
    self.attended_events.past
  end

  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.invites.create!(attended_event_id: event.id)
  end

  def cancel!(event)
    self.invites.find_by(attended_event_id: event.id).destroy
  end


end
