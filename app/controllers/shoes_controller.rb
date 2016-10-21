class ShoesController < ApplicationController
  def index
  	@bought = Purchase.pluck(:shoe_id)
  	@products = Shoe.where.not(id: @bought)
  	@purchase = Purchase.new
  end

  def create
  	s_params = shoe_params
  	s_params['user'] = current_user
  	@shoe = Shoe.new( s_params )
  	if @shoe.save
  		redirect_to "/dashboard/#{session[:user_id]}"
  	else
  		flash[:errors] = @shoe.errors.full_messages
  		redirect_to "/dashboard/#{session[:user_id]}"
  	end
  end

  def destroy
    Shoe.find( params[:id] ).destroy if current_user == Shoe.find( params[:id] ).user
    redirect_to "/dashboard/#{session[:user_id]}"
  end

  private
  	def shoe_params
  		params.require(:shoe).permit(:name, :price)
  	end
end
