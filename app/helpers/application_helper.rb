module ApplicationHelper

  def redirect_to_url url, message, message_type
    flash[message_type] = message
    redirect_to url
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-block"
      when "notice"
        "alert-warning"
      when "info"
        "alert-info" # Blue
      else
        flash_type.to_s
    end
  end
end
