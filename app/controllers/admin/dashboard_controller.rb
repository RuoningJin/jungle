class Admin::DashboardController < ApplicationController

  before_action :authorize

  def show
    @products = Product.order(id: :desc).all
    @product_count = @products.count
    @category_count = @products.select(:category_id).distinct(:category_id).count
  end
end
