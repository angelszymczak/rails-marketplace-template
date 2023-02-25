require 'rails_helper'

RSpec.describe 'Products' do
  describe 'visiting index' do

    it 'shows the site title' do
      visit products_path
      have_text 'Products:'
    end
  end
end
