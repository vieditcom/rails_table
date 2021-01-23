module Tabular
  extend ActiveSupport::Concern
  include Pagy::Backend

  protected

  def prepare_variables
    @query = params[:query]
    @order_by = permitted_column_name(params[:order_by])
    @direction = permitted_direction(params[:direction])

    users = User.order(@order_by => @direction)
    users = users.search(@query) if @query.present?
    page_count = (users.count / Pagy::VARS[:items].to_f).ceil

    @page = (params[:page] || 1).to_i
    @page = page_count if @page > page_count
    @page = 1 if @page < 1
    @pagy, @users = pagy(users, page: @page)
  end

  private

  def permitted_column_name(column_name)
    %w[updated_at name email title phone active].find { |permitted| column_name == permitted } || "updated_at"
  end

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "desc"
  end
end
