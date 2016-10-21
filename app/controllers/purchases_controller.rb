class PurchasesController < ApplicationController
  
  before_action :require_login

  def create
  	p_params = purchase_params
  	p_params['shoe'] = Shoe.find(purchase_params['shoe_id'])
  	p_params.delete('shoe_id')
  	p_params['user'] = User.find(session[:user_id])
  	@purchase = Purchase.new( p_params )
  	if @purchase.save
  		redirect_to "/dashboard/#{session[:user_id]}"
  	else
  		redirect_to shoes_path
  	end
  end

  private
  	def purchase_params
  		params.require(:purchase).permit(:shoe_id)
  	end
end
