class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = @post.comments.select(DISTINCT user_id).map {|x| x.user}
    @comment = @post.comments.build
    @comment.user=User.new
   #@users = @post.comments.map(&:user) & @post.comments.map(&:user)
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build


  end

  def create

    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
