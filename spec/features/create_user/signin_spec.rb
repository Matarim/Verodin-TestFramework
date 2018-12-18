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

  end

  it 'Customers tab adding then clicking clients list', js: true do
    click_link('Sign in')

  end

  it 'Adding Customer then clicking save with nothing filled in', js: true do
    click_link('Sign in')
    
  end
end
