# frozen_string_literal: true

class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  def index
    @stocks = Stock.all
  end

  def show; end

  def new
    @stock = Stock.new
  end

  def edit; end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to @stock, notice: "Stock was successfully created."
    else
      render :new
    end
  end

  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: "Stock was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: "Stock was successfully destroyed."
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:quantity, :product_id)
  end
end
