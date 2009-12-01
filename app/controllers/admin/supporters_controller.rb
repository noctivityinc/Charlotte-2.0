class Admin::SupportersController < AdminController

  before_filter :get_supporter, :except => [:index, :new, :create]

  def index
    @supporters = Supporter.all(:order => "created_at asc")
  end

  def show
  end

  def new
    @supporter = Supporter.new
  end

  def create
    @supporter = Supporter.new(params[:supporter])
    if @supporter.save
      flash[:notice] = "Successfully created supporter."
      redirect_to [:admin, @supporter]
    else
      render :action => 'new'
    end
  end

  def edit

  end

  def update
    if @supporter.update_attributes(params[:supporter])
      flash[:notice] = "Successfully updated supporter."
      redirect_to [:admin, @supporter]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @supporter.destroy
    flash[:notice] = "Successfully destroyed supporter."
    redirect_to admin_supporters_url
  end

  private

  def get_supporter
    @supporter = Supporter.find_by_id(params[:id])
  end
end
