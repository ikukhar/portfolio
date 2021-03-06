module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-default", error: "alert-danger", alert: "alert-default", notice: "alert-default" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, '', class: "container") do
        concat(content_tag(:div, '', class: "col-sm-8 col-sm-offset-2") do
          concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
            concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
              concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
              concat content_tag(:span, 'Close', class: 'sr-only')
            end)
            concat message
          end)
        end)
      end)    
    end
    nil
  end

end
