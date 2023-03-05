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

      expect(page).to have_content(I18n.t("application.name"))
      expect(page).to have_content(I18n.t("products.index.title"))
      expect(page).to have_css('.product', count: 3)
    end
  end

  describe 'visiting a detailed item page' do
    let!(:item) { Product.create(title: 'item', description: 'special', price: 134) }

    it 'shows the item title' do
      visit product_path(item)

      expect(page).to have_content(I18n.t("products.show.title"))
      expect(page).to have_content(item.title)
    end
  end

  xdescribe 'render a new product form' do
    # TODO: Capybara can't find submit button with current config.
    # The adder form is loaded via JS
    #
    # Snapshot
    # ~/tmp/capybara/failures_r_spec_example_groups_products_render_a_new_product_form_shows_the_form_718.png
    it 'shows the form' do
      visit products_path
      click_link I18n.t("products.new.title")

      expect(page).to have_content(I18n.t("common.create"))
    end
  end

  describe 'allow to create a new product' do
    it 'creates successfully' do
      visit new_product_path
      fill_in 'product_title', with: 'some title'
      fill_in 'product_description', with: 'some description'
      fill_in 'product_price', with: 120
      click_on I18n.t("common.create")

      expect(page).to have_content(I18n.t("products.new.title"))
      expect(page).to have_content(I18n.t("products.create.success"))
    end

    it 'does not create' do
      visit new_product_path
      fill_in 'product_title', with: 'some title'
      click_on I18n.t("common.create")

      expect(page).to have_content(I18n.t("products.new.title"))
      # TODO: Capybara can't find failure flash alert message.
      # expect(page).to have_content(I18n.t("products.create.failed"))
      expect(page).to have_content(I18n.t("activerecord.errors.models.product.attributes.title.blank"))
      expect(page).to have_content(I18n.t("activerecord.errors.models.product.attributes.description.blank"))
      expect(page).to have_content(I18n.t("activerecord.errors.models.product.attributes.price.blank"))
    end
  end

  describe 'render an edit product form' do
    let!(:item) { create(:product) }

    it 'shows the form' do
      visit edit_product_path(item)

      expect(page).to have_content(I18n.t("common.edit"))
    end
  end

  describe 'allow to update a new product' do
    let!(:item) { create(:product) }

    it 'updates successfully' do
      visit edit_product_path(item)

      expect(page).to have_content(I18n.t("common.edit"))

      fill_in 'product_title', with: 'updated title'
      fill_in 'product_description', with: 'updated description'
      fill_in 'product_price', with: 500
      click_on I18n.t("common.update")

      expect(page).to have_content(I18n.t("products.index.title"))
      expect(page).to have_content(I18n.t("products.update.success"))
    end
  end
end
