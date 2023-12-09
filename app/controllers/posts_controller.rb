class PostsController < ApplicationController
  before_action :set_post, only: [:show, :like, :comment]

  def index
    @posts = Post.all
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    puts "user with post = #{@post.user.email}"


    if @post.save
      redirect_to posts_path
    else
      puts "error #{@post.errors.full_messages}"
      flash[:warning] = @post.errors.full_messages
      render :new
    end
  end

  def like
    @post.likes += 1
    @post.save
    redirect_to posts_path
  end

  def comment
    comment = @post.comments.build(comment_params)
    comment.user = current_user

    if comment.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: "Comment could not be saved."
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
