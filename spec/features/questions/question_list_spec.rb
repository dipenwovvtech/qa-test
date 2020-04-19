require 'rails_helper'

feature 'questions', type: :feature do
  let!(:questions) { 3.times { |i| create(:question, name: "Question #{i+1}")}}
  let!(:user) { create(:user) }

  it 'listing of questions' do
    signin_user( user, user.password )
    expect(page).to have_css("ul li a.question", text: "Question 1")
    expect(page).to have_css("ul li a.question", text: "Question 2")
    expect(page).to have_css("ul li a.question", text: "Question 3")
    expect(page).not_to have_content "Random Question"
  end
end
