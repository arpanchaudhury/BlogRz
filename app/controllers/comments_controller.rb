class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    current_blogger.comments << [@comment]
    redirect_to @post, :notice => "Comment created!"
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post, :notice => "Comment destroyed!"
  end
end
