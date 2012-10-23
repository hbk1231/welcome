require 'spec_helper'

describe "User Pages" do
	subject { page }
	
	describe "index" do
		let(:user) { FactoryGirl.create(:user) }
		
		before do
			sign_in user
			visit users_path
		end
		
		describe "as an admin user" do
			let(:admin) { FactoryGirl.create(:admin) }
			before do
				sign_in admin
				visit users_path
			end
		end
	end
	
	describe "signup page" do
		before { visit new_user_registration_path }
		
		it { should have_selector('h2', content: 'Sign Up') }
	end
	
	describe "signup" do
		before { visit new_user_registration_path }
		
		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button "Sign up" }.not_to change(User, :count)
			end
		end
		
		describe "with valid information" do
			before do
				fill_in "Email", with: "martin@example.com"
				fill_in "Password", with: "secret"
				fill_in "Password confirmation", with: "secret"
			end
			
			describe "after saving the user" do
				before { click_button "Sign up" }
				
				it { should have_link('Sign out') }
			end
			
			it "should create a user" do
				expect { click_button "Sign up" }.to change(User, :count).by(1)
			end
		end
	end
end
