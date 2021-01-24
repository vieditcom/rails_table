# frozen_string_literal: true

module TabularsHelper
  include Pagy::Frontend

  def active_status(user)
    result = user.active ? 'active' : 'inactive'
    content_tag :span, result, class: result
  end

  def column_css(column_name)
    "selected" if column_name.to_s == @order_by
  end

  def arrow(column_name, desc_class, asc_class)
    return if column_name.to_s != @order_by
    @direction == "desc" ? " sort-icon #{desc_class}" : " sort-icon #{asc_class}"
  end

  def direction
    @direction == "asc" ? "desc" : "asc"
  end

  def pagy_get_params(params)
    params.merge query: @query, order_by: @order_by, direction: @direction
  end

  def prev_page
    @pagy.prev || 1
  end

  def next_page
    @pagy.next || @pagy.last
  end
end
