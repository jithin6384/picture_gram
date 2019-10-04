class CommentsController < ApplicationController
  before_action :set_post


  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
       respond_to do |format|
      	format.html {redirect_to root_path}
      	format.js {}
        # render partial: 'post_comment'
       end
    end   
  end

  private 
   def set_post
      @post = Post.find(params[:post_id])
   end

   def comment_params
     params.require(:comment).permit(:content)
   end

end
