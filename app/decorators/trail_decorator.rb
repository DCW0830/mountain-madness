class TrailDecorator < Draper::Decorator
  delegate_all

  def format_created_at
    trail.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def short_description
    h.truncate(trail.description, length: 60)
  end
end
