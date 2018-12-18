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
    #SpecSupportHelpers::SignInLink.click_sign_in
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

    new_user.send_keys 'testemail@verodin.com'

    page.find("#SubmitCreate").click

    page.find('#id_gender1').click
    page.find('#customer_firstname').send_keys('Matthew')
    page.find('#customer_lastname').send_keys('Rampey')
    page.find('#email').send_keys('testemail@verodin.com')
    page.find('#passwd').send_keys('passW0rd')
    page.find
    page.find
    page.find

  end
end
