module ApplicationHelper
  def format_date(date)
    date.present? ? date.strftime('%d %B, %Y') : nil
  end
end
