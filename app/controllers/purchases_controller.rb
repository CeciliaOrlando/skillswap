class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @purchases = Purchase.where(user: current_user)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @course = Purchase.find(params[:id])
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.course = @course
    @purchase.price = @course.price
    if @purchase.save
      redirect_to purchases_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      redirect_to @purchases
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  private

  def purchase_params
    params.require(:purchase).permit(:user_id, :course_id)
  end
end
