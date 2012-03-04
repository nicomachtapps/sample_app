require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end
  
  describe "profile page" do
    let(:user) { User.create(name: 'drbizeps', email: "don-nico@hotmail.de", password: "foobar") }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
  
  describe "signup" do

      before { visit signup_path }

      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button "Sign up" }.not_to change(User, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Name",         with: "Example User"
          fill_in "Email",        with: "user@example.com"
          fill_in "Password",     with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end

        it "should create a user" do
          expect { click_button "Sign up" }.to change(User, :count).by(1)
        end
      end
    end
    
    describe "edit" do
        let(:user) { User.create(name: 'test', email: 'testuser@test.de', password: 'password', password_confirmation: 'password') }
        before { visit edit_user_path(user) }

        describe "page" do
          it { should have_selector('h1',    text: "Edit user") }
          it { should have_selector('title', text: "Edit user") }
          it { should have_link('change', href: 'http://gravatar.com/emails') }
        end

        describe "with invalid information" do
          let(:error) { '1 error prohibited this user from being saved' }
          before { click_button "Update" }

          it { should have_content(error) }
       end
      end
end