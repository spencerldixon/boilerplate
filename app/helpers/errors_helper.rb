module ErrorsHelper
  def error_message_on(object, attribute)
    return unless object.respond_to?(:errors) && object.errors.include?(attribute)

    error_message = "#{attribute.to_s.humanize} #{object.errors[attribute].join(", ")}"

    content_tag(:div, class: "flex items-center text-red-600 text-xs mt-2") do
      content_tag(:i, nil, class: "fa-solid fa-circle-exclamation inline mr-1") + error_message
    end
  end
end
