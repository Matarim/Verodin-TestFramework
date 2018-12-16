require 'spec_helper'

feature 'Visit Home Page', :type => :feature do
  #Goes to page
  visit 'http://automationpractice.com/'

  #let(:user) { FactoryBot.create(:user) }

  #Below is what could be used when you may need to
  #call a function prior to the tests running

  #before :each do
  #  sign_in_user(user)
  #  click_link('Customers')
  #  expect(find('div.btn-toolbar')).to have_content('Add Customer')
  #  click_link('Add Customer')
  #end

  it 'Confirm Page Exists', js: true do
    #Looks for specific field that will contain text that wouldn't be expected to change.
    #This test is included, it will aide in stopping the tests once we switch to headless browser
    #helping determine that the tests are failing due to page not being located.
    expect(find('#editorial_block_center')).to include('Automation Practice Website')

  end

  it 'Confirm Global Links are clickable', js: true do
    click_link('Women')
    expect(.content_scene_cat_bg).to include('You will find here all woman fashion collections.')
    click_link('Dresses')
    expect()
    click_link('T-Shirts')
    expect()
  end

  it 'Customers tab adding then clicking clients list', js: true do
    click_link('Customer List')
    expect(page).to have_content('Customers')
  end

  it 'Adding Customer then clicking save with nothing filled in', js: true do
    click_button('Save')
    expect(parsley_error_for('#client_name')).to have_text('This value is required.')
  end
end
