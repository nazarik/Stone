module HomePagesHelper
  def double_columned_list(collection)
    size = collection.count
    return if size.zero?

    html = []
    first_column_size = (size.to_f/2).round
    second_column_size = size - first_column_size
    list_data = [
            {size: first_column_size, class: 'list list-pad', action: 'limit'},
            {size: second_column_size, class: 'list', action: 'last'}
           ]

    list_data.each do |list|
      next if list[:size].zero?
      html << content_tag(:ul, class: list[:class]) do
                collection.send("#{list[:action]}", list[:size]).collect do |element|
                  content_tag(:li, link_to(element.name, [element, :products]))
                end.join.html_safe
              end
    end
    html.join.html_safe
  end
end
