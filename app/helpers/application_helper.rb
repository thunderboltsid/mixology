module ApplicationHelper
  #Returns the full title on a per-page basis
  def full_title(page_title)
    @location = page_title
    base_title = "Mixology"
    if page_title.empty?
      base_title
      @location = ""
    else
      "#{base_title} | #{page_title}"
    end
  end
end
