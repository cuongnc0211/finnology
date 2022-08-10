module ApplicationHelper
  def flash_alert_class(key)
    case key
    when 'notice'
      'success'
    when 'alert', 'error'
      'danger'
    else
      key
    end
  end
end
