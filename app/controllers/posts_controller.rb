class PostsController < PublicController
  before_filter :get_post, :except => [:index, :new, :create] 
  
  def index
    @posts = Post.active[0..10] unless params[:all]
    #@posts = Post.all
     @supporters = Supporter.all
     session[:support_registered] = nil
  end
  
  def show
  end
  
  def new
    @post = Post.new(:posted_at => Time.now)
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
  
  private 
  
    def get_post
      @post = Post.find_by_permalink(params[:id])
      @post ||= Post.find(params[:id])
    end
end
