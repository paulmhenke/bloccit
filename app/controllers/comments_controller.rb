class CommentsController < ApplicationController
  def create
    # in the view, only render the form if policy(comment).create?
    # find the topic
    # find the post
    # post.comments.create
    # associate the comment with a user
    # save the comment, and redirect to the post
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
      if @comment.save
        flash[:notice] = "Your comment was saved." 
        redirect_to [@post]
      else
        flash[:error] = "There was a problem saving your comment.  Please try again."
        render :create
      end
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
    end
end
