class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.includes(:payments).order(name: :asc)
  end

  def total_amount(category)
    category.payments.sum(:amount)
  end
  helper_method :total_amount

  def show; end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
