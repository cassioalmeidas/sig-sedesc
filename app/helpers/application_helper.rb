module ApplicationHelper

  def dropdown_divider
    content_tag(:div, '', class: 'dropdown-divider').html_safe
  end

  def nav_bar
    content_tag(:ul, class: 'navbar-nav mr-auto') do 
      yield
    end
  end

  def nav_link(text, path)
    options = current_page?(path) ? { class: 'nav-item active' } : { class: 'nav-item' }
    text += content_tag(:span, '(current)', class: 'sr-only') if current_page?(path)
    content_tag(:li, options) do 
      link_to(path, { class: 'nav-link' }) do 
        text.html_safe
      end
    end
  end

  def active_link_to(text, destination, options = {})
    match_text = options.delete(:match_text)
    classes = options[:class].present? ? options[:class].split(" ") : []
    classes << 'active' if request.fullpath.downcase == destination.downcase || (match_text && request.fullpath.downcase.include?(match_text.downcase))
    options = options.except(:class)
    options.merge!(:class => classes.join(" ")) unless classes.empty?
    link_to(text, destination, options)
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end
end
