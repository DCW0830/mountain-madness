class DashboardDecorator < Draper::Decorator
  delegate_all

  def short_description
    h.truncate(self.description, length: 60)
  end

  def image
    h.image_tag self.thumbnail
  end

end
