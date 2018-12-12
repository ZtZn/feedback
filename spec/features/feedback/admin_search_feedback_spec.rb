require "rails_helper"

feature "Leave feedback" do
  let(:user) { create :user, :admin }
  let(:feedback) { {name: "John Smit", email: "john@example.com", text: "Hello"}}
  let(:feedback) { {name: "Michael Brown ", email: "misha@example.com", text: "Help"}}

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "Admin User I want to search through feedbacks" do
    sign_in(user.email, user.password)

    click_link "Feedbacks"

    within 'table' do
      expect(page).to have_content("Hello")
    end
   # expect(page).to have_text("Name")
  end
end
