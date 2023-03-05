# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.with_attached_photo
  end

  # este es el metodo que resuelve el endpoint y retorna un formulario
  # al link_to "Add Product" en formato html
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: t(".success")
    else
      flash[:alert] = t(".failed")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: t(".success")
    else
      flash[:alert] = t(".failed")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, status: :see_other, notice: t(".success")
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    redirect_to products_path, alert: error.message, status: :not_found
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
end
