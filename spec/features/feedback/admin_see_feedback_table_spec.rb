require "rails_helper"

feature "Leave feedback" do
  let(:user) { create :user, role: "admin" }

  let(:feedback) {create :feedback}


  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "As Admin User I want to see list of all Feedbacks" do
    sign_in(user.email, user.password)

    click_link "Feedbacks"

    #expect(page).to have_css('table', text: feedback.text)
    expect(page).to have_text(feedback.text)
  end
end
