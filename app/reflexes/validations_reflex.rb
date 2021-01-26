# frozen_string_literal: true

class ValidationsReflex < ApplicationReflex

  def validate
    if (@user = User.find_by_id(element.dataset['user-id']))
      @user.assign_attributes(user_params)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :title, :active)
  end

end
