require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
  	before { visit login_path }

  	it { should have_content('Log in') }
  	
  end

  describe "login" do
      before { visit login_path }

	  describe "with invalid information" do
	  	before { click_button "Log in" }

	  	it { should have_title('Log in') }
	  	it { should have_selector('div.alert.alert-error') } 

	  	describe "after visiting another page" do
	  		before { visit books_path }

	  		it { should_not have_selector('div.alert.alert-error')}

	  	end

	  end

	  describe "with valid information" do

	  	let(:user) { FactoryGirl.create(:user) }
	  	before do
	  		fill_in "Email", with: user.email.upcase
	  		fill_in "Password", with: user.Password
	  		click_button "Sign in"
	    end

	    it { should have_title('Kiosk Viewer')}
	    #could check other things on proper landing page.

	  end
  end
end
