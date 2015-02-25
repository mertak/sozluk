module WelcomeHelper

  def random_post
    @post = Post.order("RANDOM()").first
    @post.title.upcase
  end

end
