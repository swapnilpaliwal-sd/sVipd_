module ApplicationHelper

  def sorting_login_table(column_name, title = nil)
    title = column_name.titleize
    direction = column_name == initial_sorting_merchant_login  && direction_asc == "asc" ? "desc" : "asc"
    link_to title, :sort => column_name, :direction => direction
  end

end
