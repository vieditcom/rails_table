# frozen_string_literal: true

class UsersController < ApplicationController
  include Tabular

  def index
    prepare_variables
    @user ||= User.new(user_params)
    @user.validate
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'User was successfully added.' }
      else
        format.html { redirect_to users_url, alert: @user.errors.full_messages }
      end
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  rescue
    head :unprocessable_entity
  end

  private

  def user_params
    return {} unless params.key?(:user)
    params.require(:user).permit(:name, :email, :phone, :title, :active)
  end

end
