# frozen_string_literal: true

class ModalReflex < ApplicationReflex

  def append_edit_form
    user = User.find(element.dataset['modal-user'])
    morph '#append-edit-form', render(partial: 'users/edit_form', locals: {user: user})
  end

end
