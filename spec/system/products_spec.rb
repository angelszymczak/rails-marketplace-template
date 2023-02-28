require 'rails_helper'

RSpec.describe 'Products' do
  describe 'visiting index' do
    before do
      Product.create(
        [

          { title: 'item1', description: 'new', price: 1342 },
          { title: 'item2', description: 'old', price: 9897 },
          { title: 'item3', description: 'used', price: 2323 },
        ]
      )
    end

    it 'shows the site title' do
      expect(Product.count).to eq(3)
      visit products_path
      expect(page).to have_content('Products')
      expect(page).to have_css('.product', count: 3)
    end
  end

  describe 'visiting a detailed item page' do
    let!(:item) { Product.create(title: 'item', description: 'special', price: 134) }

    it 'shows the item title' do
      visit product_path(item)
      expect(page).to have_content(item.title)
    end
  end

  describe 'render a new product form' do
    it 'shows the form' do
      visit products_path
      click_link 'Add Product'

      expect(page).to have_content('Nuevo Producto')
    end
  end

  describe 'allow to create a new product' do
    it 'creates successfully' do
      visit new_product_path

      fill_in 'product_title', with: 'some title'
      fill_in 'product_description', with: 'some description'
      fill_in 'product_price', with: 120

      click_on 'Create Product'

      expect(page).to have_content('Products')

      expect(page).to have_content('some title')
    end

    it 'does not create successfully' do
      visit new_product_path

      fill_in 'product_title', with: 'some title'

      click_on 'Create Product'

      expect(page).to have_content('Nuevo Producto')

      expect(page).to have_content('Description can\'t be blank')
      expect(page).to have_content('Price can\'t be blank')
    end
  end

  describe 'render an edit product form' do
    let!(:item) { create(:product) }

    it 'shows the form' do
      visit edit_product_path(item)

      expect(page).to have_content('Editar Producto')
    end
  end
end
