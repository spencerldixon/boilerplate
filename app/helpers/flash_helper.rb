module FlashHelper
  def flash_css_class(key)
    case key.to_sym
    when :alert
      "bg-red-100 text-red-700"
    when :notice
      "bg-green-100 text-green-700"
    else
      "bg-blue-100 text-blue-700"
    end
  end
end
