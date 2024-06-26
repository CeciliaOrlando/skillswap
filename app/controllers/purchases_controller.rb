class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(user: current_user)
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
    @course = Course.find(params[:course_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @purchase = Purchase.new
    @purchase.user = current_user
    @purchase.course = @course
    @purchase.amount = @course.price
    if @purchase.save!
      redirect_to purchases_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path, status: :see_other
  end
end
