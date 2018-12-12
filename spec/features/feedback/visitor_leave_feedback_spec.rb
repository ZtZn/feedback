require "rails_helper"

feature "Leave feedback" do
  let(:feedback_attributes) { attributes_for(:feedback).slice(:name, :email, :text) }

  scenario "Visitor leave feedback " do
    visit new_feedback_path

    fill_form(:feedback, feedback_attributes)
    click_button "Submit feedback"

    expect(page).to have_content("Feedback was successfully send!")
  end
end
