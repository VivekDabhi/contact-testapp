module ApplicationHelper
	def page_index(page, index, count=10)
    if page.present? && page.to_i > 1
      "<td>#{((page.to_i - 1) * count) + (index+1)}</td>".html_safe
    else
      "<td>#{index+1}</td>".html_safe
    end
  end
end
