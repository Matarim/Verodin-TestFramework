require 'spec_helper'

feature 'Create User', :type => :feature do
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
    click_link('Sign in')
    expect(".navigation_page").to have_text('Authentication')

  end

  it 'Confirm Validation Error for Email field', js: true do
    @new_user = page.find('email_create')
    @new_user.click

    click_button('#SubmitCreate')
    expect(page).to have_content('#create_account_error')

  end

  it 'Create Account', js: true do
    @new_user.send_keys('testemail@verodin.com')
    click_button('#SubmitCreate')

    expect(".page-heading").to have_text('Create an account')

  end

  it 'Filling in Personal Information form', js: true do
    page.find('#id_gender1').click
    page.find('#customer_firstname').send_keys('Matthew')
    page.find('#customer_lastname').send_keys('Rampey')
    page.find('#email').send_keys('testemail@verodin.com')
    page.find('#passwd').send_keys('passW0rd')
    

  end
end
