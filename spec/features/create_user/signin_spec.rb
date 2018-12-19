require 'spec_helper'

feature 'Login', :type => :feature do


  #let(:user) { FactoryBot.create(:user) }

  #Below is what could be used when you may need to
  #call a function prior to the tests running

  before :each do
    #Goes to page
    visit 'http://automationpractice.com/'
  end

  it 'Confirm Page Exists', js: true do
    click_link('Sign in')

    existingUser = page.find("#email")
    existingUser.click
    existingUser.send_keys('testemail@verodin.com')
    existingPass = page.find("passwd")
    existingPass.click
    existingPass.send_keys("password")

    click_button("#SubmitLogin")
    headerText = page.find("#center_column > .page-heading")
    expect(headerText).to have_text('MY ACCOUNT')

  end

end
