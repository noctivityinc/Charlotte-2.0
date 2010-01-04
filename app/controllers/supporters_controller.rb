class SupportersController < PublicController
  
  layout 'support'
  
  def index
    @supporter = Supporter.new
  end

  def new
    @supporter = Supporter.new
    render :index
  end

  def create
    @supporter = Supporter.new(params[:supporter])
    if @supporter.save
      flash[:notice] = "Thank you for supporting Charlotte 2.0"
      #Notify.deliver_thankyou(@supporter)
      #Notify.deliver_new_supporter(@supporter)
      session[:support_registered] = true
      redirect_to root_url
    else
      @hide_sidebar_form = false
      flash[:error] = "Please Try Again"
      render :action => 'new'
    end
  end

  private

end
