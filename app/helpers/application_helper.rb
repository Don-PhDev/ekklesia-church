module ApplicationHelper
  def active_link_to(path)
    content_tag(:li, class: "#{'active' if current_page?(path)}") do
      link_to path, class: "#{'active' if current_page?(path)} nav-link" do
        yield
      end
    end
  end
end
