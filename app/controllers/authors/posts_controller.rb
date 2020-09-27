module Authors

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_author!, except: [:index, :show]
  layout 'authors'

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    impressionist(@post)
  end



  def like
    @post = Post.find(params[:id])
    #raise @post.like_count.inspect
    like = @post.like_count.nil? ? 0.to_i : @post.like_count
    #raise like.inspect
    like_new = like + 1.to_i
@post.update_attributes(:like_count => like_new)
    redirect_to posts_path
  end

  # GET /posts/new
  def new
    @post = current_author.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = current_author.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :description)
    end
end


end
