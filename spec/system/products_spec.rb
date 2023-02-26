require 'rails_helper'

RSpec.describe 'Products' do
  describe 'visiting index' do
    before do
      Product.create(
        [

          { title: 'item1', description: 'new' },
          { title: 'item2', description: 'old' },
          { title: 'item3', description: 'used' },
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
    let!(:item) { Product.create(title: 'item', description: 'special') }

    it 'shows the item title' do
      visit product_path(item)
      expect(page).to have_content(item.title)
    end
  end
end
