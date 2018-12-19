require 'spec_helper'

feature 'Create User', :type => :feature do


  #let(:user) { FactoryBot.create(:user) }

  #Below is what could be used when you may need to
  #call a function prior to the tests running

  before :each do
    #Goes to page
    visit 'http://automationpractice.com/'

  end

  it 'Confirm Page Exists', js: true do
    click_link('Sign in')
    pageVerification = page.find("#center_column > .page-heading")
    expect(pageVerification).to have_text('AUTHENTICATION')

  end

  it 'Confirm Validation Error for Email field', js: true do
    click_link('Sign in')
    new_user = page.find("#email_create")
    new_user.click

    page.find("#SubmitCreate").click
    validationError = page.find("#create_account_error")
    expect(validationError).to have_text('Invalid email address.')

  end

  it 'Create Account', js: true do
    click_link('Sign in')
    new_user = page.find("#email_create")
    new_user.click
    new_user.send_keys "#{Faker::Internet.safe_email}"
    page.find("#SubmitCreate").click
    headerText = page.find("#center_column > #noSlide > .page-heading")
    expect(headerText).to have_text('CREATE AN ACCOUNT')

    page.find("#id_gender1").click
    page.find("#customer_firstname").send_keys("#{Faker::Name.first_name}")
    page.find("#customer_lastname").send_keys("#{Faker::Name.last_name}")
    page.find("#passwd").send_keys("#{Faker::Internet.password}")
    page.find("#address1").send_keys('152 Bronte Ave')
    page.find("#city").send_keys('Inwood')
    stateSelect = page.find("#uniform-id_state").click
    stateSelect.find(:option, 'West Virginia').select_option
    page.find("#postcode").send_keys('25428')
    page.find("#phone_mobile").send_keys('8153470956')
    page.find("#submitAccount").click

  end
end
