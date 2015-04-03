class SummariesController < ApplicationController
  def show
    @summary = Summary.find(params[:id])
    @post = @summary.post
  end

  def new
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary
  end
  
  def create
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary(params[:summary])
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@post.topic, @post, @summary]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
       render :new
    end
  end
end
