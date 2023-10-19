class PaymentsController < ApplicationController
  before_action :set_category, only: %i[index show new create edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    redirect_to categories_path unless @category.user == current_user
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
  end

  def sum
    @total_amount = @category.payments.sum(:amount)
  end
  helper_method :sum

  def new
    @payment = Payment.new
    @categories = current_user.categories.order(name: :asc)
  end

  def create
    @payment = current_user.payments.build(payment_params)

    if @payment.save
      redirect_to category_payments_path(@category)
    else
      @categories = current_user.categories.order(name: :asc)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_path
  end

  def payment_params
    params.require(:payment).permit(:amount, :name, :category_ids)
  end
end
