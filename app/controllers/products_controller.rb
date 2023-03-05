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
      flash[:notice] = 'Product created successfully'
      redirect_to products_path
    else
      flash[:alert] = 'Product creation was failed'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'your product was updated'
      redirect_to products_path
    else
      flash[:alert] = 'Product update was failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = 'your product was deleted'
    redirect_to products_path, status: :see_other
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
