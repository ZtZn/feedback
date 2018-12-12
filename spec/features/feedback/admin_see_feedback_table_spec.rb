require "rails_helper"

feature "Administrate feedback" do
  let(:user) { create :user, role: "admin" }

  let!(:feedback) { Feedback.create name: "John Smit", email: "john@example.com", text: "Hello" }
  let!(:feedback2) { Feedback.create name: "Michael Brown ", email: "misha@example.com", text: "Help" }

  def sign_in(email, password)
    visit new_user_session_path

    fill_form(:user, email: email, password: password)
    click_button "Sign in"
  end

  scenario "As Admin User I want to see list of all Feedbacks" do
    sign_in(user.email, user.password)

    click_link "Feedbacks"

    expect(page).to have_text(feedback.text)
    expect(page).to have_text(feedback.name)
    expect(page).to have_text(feedback.email)
  end

  scenario "Admin User want to search through feedbacks name" do
    sign_in(user.email, user.password)

    click_link "Feedbacks"

    fill_in "Enter your search query here", with: "john"
    click_button("Search")
    expect(page).to have_content("John Smit")
    expect(page).not_to have_content("Michael Brown")
  end

  scenario "Admin User want to search through feedbacks text" do
    sign_in(user.email, user.password)

    click_link "Feedbacks"

    fill_in "Enter your search query here", with: "Help"
    click_button("Search")
    expect(page).to have_content("Michael Brown")
    expect(page).not_to have_content("John Smit")
  end
end
