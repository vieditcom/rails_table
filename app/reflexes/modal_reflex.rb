# frozen_string_literal: true

class ModalReflex < ApplicationReflex

  def append_form
    user = User.find_by_id(element.dataset['modal-user']) || User.new
    morph '#append-edit-form', render(partial: 'users/edit_form', locals: {user: user})
  end

end
