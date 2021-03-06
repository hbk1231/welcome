require 'spec_helper'

describe "Authentication" do

  subject { page }
  
  describe "signin page" do
  	before { visit new_user_session_path }

    it { should have_selector('h2',    text: 'Sign in') }

  end
  
  describe "signin" do
    before { visit new_user_session_path }
    
    describe "with invalid information" do
    	before { click_button "Sign in" }

			it { should have_selector('h2',    text: 'Sign in') }
#    	it { should have_selector('div', :conent => 'Invalid email or password.') }
#			it { should have_selector('div.flash.alert',	content: 'Invalid email or password.') }
			it { should have_selector('div', text: 'Invalid email or password.') }
    end
    
    describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before { valid_signin(user) }
			
			it { should have_link('Sign out', href: destroy_user_session_path) }
		end
  end
end
