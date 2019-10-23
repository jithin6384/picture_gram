class PostsController < ApplicationController
	before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :post_owner, only: [:edit, :update, :destroy]

	def index
    @user = User.find(current_user.id)
    @posts = @user.posts 
    if @posts.present?
      @posts = Post.order('created_at DESC').page params[:page]
    end
	end

	def new 
	 @post = Post.new

	end

	def create
	   @post = Post.new(permit_params)
     @post.user_id = current_user.id
	   if @post.save
		  redirect_to root_path
		  flash[:success]="Your post was created"
	   else
	   	  flash[:alert] = " your post was not created"
		  render 'new'
		  
	   end
    end
    
    def edit
     
    end

    def update
      if @post.update(permit_params)
           redirect_to root_path
           flash[:success]="your post was updated"
       else
          flash[:alert] = "your post was not updated"
          render 'edit'
       end
    end
	def show
  
	end

	def destroy
      
      @post.destroy
      redirect_to posts_path
      flash[:alert]="Your post was successfully deleted"
	end

  private
    def permit_params
      params.require(:post).permit(:title, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_owner
      if @post.user != current_user
         flash[:alert] ="you are not authorised to perform these actions"
         redirect_to root_path
      end
    end

end
