module ApplicationHelper
  def navigation_link(link_text, link_path, options={}, &block)
    parent_class = current_page?(link_path) ? 'active' : ''
    nested_html = ''

    if block_given?
      nested_html = content_tag(:ul) do
                      yield.collect do |resource|
                        path = url_for([resource, options[:resource]])
                        parent_class = 'active' if current_page?(path)
                        nested_class = current_page?(path) ? 'active' : ''
                        content_tag(:li, link_to(resource.name, path), class: nested_class)
                      end.join.html_safe
                    end
      parent_class.concat(' sub-menu')
    end

    content_tag(:li, link_to(link_text, link_path).concat(nested_html), class: parent_class).html_safe
  end
end
