module EventsHelper

  def host?(user)
    current_user == user
  end

  def upcoming?(event)
    event.date > Date.today
  end

  def past?(event)
    event.date < Date.today
  end

end
