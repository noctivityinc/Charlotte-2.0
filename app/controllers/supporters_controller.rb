class SupportersController < PublicController
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
       redirect_to root_url
     else
       flash[:error] = "There was a problem saving your information.  Please see the form on the right."
       render :action => 'index'
     end
   end

   private

end
