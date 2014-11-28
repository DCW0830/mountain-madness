class TrailDecorator < Draper::Decorator
  delegate_all

  def format_created_at
    trail.created_at.strftime("%m/%d/%Y - %H:%M")
  end

  def short_description
    h.truncate(trail.description, length: 60)
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
