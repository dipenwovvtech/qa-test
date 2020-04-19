require 'rails_helper'

feature 'questions', type: :feature do
  let!(:questions) { 3.times { |i| create(:question, name: "Question #{i+1}")}}
  let!(:user) { create(:user) }

  it 'clicking on question redirect to question page' do
    signin_user( user, user.password )
    first(:link, "Question 1").click

    expect(page).to have_css("h2", text: "Question 1")
  end
end
