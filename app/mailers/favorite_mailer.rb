class FavoriteMailer < ApplicationMailer
  default from: "notsure@example.com"
  
  def new_comment(user, post, comment)
    
    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@paulhenke-bloccit.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@paulhenke-bloccit.com>"
    headers["References"] = "<post/#{post.id}@paulhenke-bloccit.com>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
