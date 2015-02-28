module ApplicationHelper


  def posts_sorted_date
    Post.order('created_at DESC')
  end


  def posts_sorted_date!
    Post.order('created_at ASC')
  end

  def bootstrap_class_for flash_type
    case flash_type
      when "success"
        "alert-success"
      when "error"
        "alert-danger"
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
    else
    flash_type.to_s
    end
  end

  def logged_in
    !current_writer.nil?
  end

  def admin_logged_in
    !current_admin.nil?
  end

end
