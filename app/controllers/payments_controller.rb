class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :set_category, only: %i[index show new create edit update destroy]
  before_action :authenticate_user!

  def index
    @payments = @category.payments.order(created_at: :desc)
    @total_amount = @payments.sum(:amount)
    @new_payment = Payment.new
    @payment = @category.payments.build
  end

  def sum
    @total_amount = @category.payments.sum(:amount)
  end
  helper_method :sum

  def show; end

  def new
    @payment = Payment.new
    @categories = Category.all
  end

  def edit; end

  def create
    @payment = @category.payments.build(payment_params)
    @payment.author = current_user

    if @payment.save
      # Crea la relación PaymentCategory para asociar el pago con la categoría
      PaymentCategory.create!(payment: @payment, category: @category)
      redirect_to category_payments_path(@category), notice: 'Payment was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_payment
    @payment = @category.payments.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to categories_path, alert: 'Category not found.'
  end

  def payment_params
    params.require(:payment).permit(:amount, :name, :date)
  end
end
