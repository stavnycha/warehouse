module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    @column = column

    link_to title, params.merge(:sort => column, :direction => direction, :page => nil, remote: true), 
      { :class => css_class }
  end

  private
  attr_reader :column

  # css class for sorting arrow
  def css_class
    column.downcase == sort_column.downcase ? "glyphicon glyphicon-chevron-#{sort_html_class(sort_direction)}" : nil
  end

  # css class for sorting arrow direction
  def sort_html_class(direction)
    direction == 'asc' ? 'up' : 'down'
  end

  def direction
    column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  end
end