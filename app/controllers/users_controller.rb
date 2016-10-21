class UsersController < ApplicationController
  def show
  	@shoe = Shoe.new
    @bought = Purchase.pluck(:shoe_id)
  	@listed = Shoe.where(user: current_user).where.not(id: @bought)
  	@sold = User.find( current_user.id ).shoes_sold
  	@purchased = User.find( current_user.id ).shoes_purchased
  end

  def create
  	@user = User.new( user_params )
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to shoes_path
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to main_path
  	end
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end

end
