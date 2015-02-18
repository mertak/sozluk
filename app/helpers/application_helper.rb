module ApplicationHelper

  def all_posts
    Post.order('created_at DESC')
  end
end
