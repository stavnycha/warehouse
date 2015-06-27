module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column.downcase == sort_column.downcase ? "glyphicon glyphicon-chevron-#{sort_html_class(sort_direction)}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil, remote: true), { :class => css_class }
  end

  def sort_html_class(direction)
    direction == 'asc' ? 'up' : 'down'
  end
end