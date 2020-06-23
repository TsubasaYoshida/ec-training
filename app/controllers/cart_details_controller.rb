# frozen_string_literal: true

class CartDetailsController < ApplicationController
  before_action :set_cart_detail, only: %i[show edit update destroy]

  def index
    @cart_details = CartDetail.all
  end

  def show; end

  def new
    @cart_detail = CartDetail.new
  end

  def edit; end

  def create
    @cart_detail = CartDetail.new(cart_detail_params)
    if @cart_detail.save
      redirect_to @cart_detail, notice: "CartDetail was successfully created."
    else
      render :new
    end
  end

  def update
    if @cart_detail.update(cart_detail_params)
      redirect_to @cart_detail, notice: "CartDetail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @cart_detail.destroy
    redirect_to cart_details_url, notice: "CartDetail was successfully destroyed."
  end

  private

  def set_cart_detail
    @cart_detail = CartDetail.find(params[:id])
  end

  def cart_detail_params
    params.require(:cart_detail).permit(:cart_id, :product_id, :quantity)
  end
end
