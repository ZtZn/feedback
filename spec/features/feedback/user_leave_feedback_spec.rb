require "rails_helper"

feature "Leave feedback" do
  let(:user) { create :user }
  let(:feedback_attributes) { attributes_for(:feedback).slice(:text) }

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "User leave feedback" do
    sign_in(user.email, user.password)

    visit new_feedback_path

    fill_form(:feedback, feedback_attributes)
    click_button "Submit feedback"

    expect(page).to have_content("Feedback was successfully send!")
  end
end
