require 'rails_helper'

RSpec.describe 'Products' do
  describe 'GET /products' do
    it 'returns http OK' do
      get '/products'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/:id' do
    let(:product) { Product.create(title: 'sample', description: 'something', price: 100) }

    it 'returns http OK' do
      get '/products', params: { id: product.id }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/new' do
    it 'returns http OK' do
      get '/products/new'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /products' do
    it 'returns http FOUND' do
      post '/products', params: { product: { title: 'new product', description: 'new description', price: 1280 } }

      expect(response).to have_http_status(:found)
    end
  end
end
