class PinsController < ApplicationController
  before_action :require_login, except: [:show, :show_by_name]
  
  def index
    # @pins = Pin.all
    @pins = Pin.where("user_id = #{current_user.id}")
  end
  
  def show
    @pin = Pin.find(params[:id])
  end
  
  def show_by_name
  	@pin =  Pin.find_by_slug(params[:slug])
  	render :show
  end
  
  def new
    @pin = Pin.new
  end
  
  def create
    @pin = Pin.create(pin_params)
	if (@pin.valid?)
	  @pin.save
	  redirect_to pin_path(@pin)
#	  redirect_to "/pins/name-#{@pin.slug}"
	else
		@errors = @pin.errors
		render :new
	end
  end
  
  def edit
    @pin = Pin.find(params[:id])
  end
  
  def edit_by_name
    @pin = Pin.find_by_slug(params[:slug])
	render :edit
  end
   
  def update
    @pin = Pin.find(params[:id])
    @pin.update_attributes(pin_params)
	if (@pin.valid?)
	  @pin.save
	  redirect_to pin_path(@pin)
#	  redirect_to "/pins/name-#{@pin.slug}"
	else
		@errors = @pin.errors
		render :edit
	end
  end
 
  private
  def pin_params
  	params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
  end

end
