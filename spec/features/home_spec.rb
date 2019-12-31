require 'spec_helper'

feature 'Visit Home Page', :type => :feature do


  #let(:user) { FactoryBot.create(:user)

  #Runs the function before each IT block
  before :each do
    #Goes to page
    visit 'http://automationpractice.com/'
  end

  it 'Confirm Page Exists', js: true do
    #Looks for specific field that will contain text that wouldn't be expected to change.
    #This test is included, it will aide in stopping the tests once we switch to headless browser
    #helping determine that the tests are failing due to page not being located.
    #Inside the variable you will see > this is used when attempting to select an ID, Class etc.. that is buried.
    pageConfirmation = page.find("#editorial_block_center > #editorial_image_legend")
    expect(pageConfirmation).to have_text('Subsidiary of seleniumframework.com')

  end

  it 'Confirm Global Links are clickable', js: true do
    #Due to multiple options for each link specifying the first one was not ideal but necessary.
    first(:link, 'Women').click
    first(:link, 'Tops').click
    categoriesLabel = page.find("#categories_block_left > .title_block")
    expect(categoriesLabel).to have_text('TOPS')
    click_link('Dresses')
    expect(categoriesLabel).to have_text('DRESSES')
    click_link('T-shirts')
    secondLabel = page.find("#layered_block_left > .title_block")
    expect(secondLabel).to have_text('CATALOG')
  end

  it 'Click the shop now link', js: true do
    #This makes sure to select the first option.  Can be used when duplicate ID's, Class's are present.
    first(:button, 'Shop now !').click()
    expect(page).to have_text("PrestaShop")
  end

  it 'Click Cart', js: true do
    click_link('Cart')
    cartHeader = page.find("#center_column > #cart_title")
    expect(cartHeader).to have_text('SHOPPING-CART SUMMARY')
  end

  it 'Click Best Sellers Link', js: true do
    click_button('Best Sellers')
    cartHeader = page.find(".product-name")
    expect(cartHeader).to have_text('Printed Chiffon Dress')
  end

  it 'Click About Us In Footer', js: true do
    click_link('About us')
    cartHeader = page.find(".cms-block > .page-subheading")
    expect(cartHeader).to have_text('Company')
  end

end
