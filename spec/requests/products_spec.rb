require 'rails_helper'

RSpec.describe 'Products' do
  describe 'GET /products' do
    it 'returns http 200' do
      get '/products'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/:id' do
    let(:item) { Product.create(title: 'sample', description: 'something', price: 100) }

    it 'returns http 200' do
      get '/products', params: { id: item.id }

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /products/new' do
    it 'returns http 200' do
      get '/products/new'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /products' do
    it 'returns http 302' do
      post '/products', params: { product: { title: 'new product', description: 'new description', price: 1280 } }

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq(I18n.t('products.create.success'))
    end

    it 'returns http 422' do
      post '/products', params: { product: { title: 'missing fields' } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq(I18n.t("products.create.failed"))
    end
  end

  describe 'GET /products/edit/:id' do
    let!(:item) { create(:product) }

    it 'returns http 200' do
      get "/products/#{item.id}/edit"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH /products/:id' do
    let!(:item) { create(:product) }

    it 'returns http 302' do
      patch "/products/#{item.id}", params: { product: { title: 'updated title' } }

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq(I18n.t("products.update.success"))
    end

    it 'returns http 422' do
      patch "/products/#{item.id}", params: { product: { title: nil } }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq(I18n.t("products.update.failed"))
    end
  end

  describe 'DELETE /products/:id' do
    let!(:item) { create(:product) }

    it 'returns http 303' do
      expect { delete "/products/#{item.id}" }.to change { Product.count }.by(-1)

      expect(response).to have_http_status(:see_other)
      expect(flash[:notice]).to eq(I18n.t("products.destroy.success"))
    end

    it 'returns http 404' do
      expect { delete "/products/1234" }.not_to change { Product.count }

      expect(response).to have_http_status(:not_found)
      expect(flash[:alert]).to eq("Couldn't find Product with 'id'=1234")
    end
  end
end
