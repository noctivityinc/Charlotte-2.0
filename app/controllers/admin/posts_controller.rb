class Admin::PostsController < ApplicationController
  before_filter :get_post, :except => [:index, :new, :create] 
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to [:admin, @post]
    else
      render :action => 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to [:admin, @post]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to admin_posts_url
  end
  
  private 
  
    def get_post
      @post = Post.find_by_id(params[:id])
    end
end
