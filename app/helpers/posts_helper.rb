module PostsHelper

  def summary(body)
    body[0..300] + "..."
  end
  
  def permalink(post)
    "http://#{request.host}/posts/#{@post.permalink}"
  end

end


