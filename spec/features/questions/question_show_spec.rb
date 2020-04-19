require 'rails_helper'

feature 'Question Detail', type: :feature do
  let!(:question) { create(:question, name: "Question 1")}
  let!(:user) { create(:user)}

  context 'question detail' do
    context "with answer multiple" do
      let!(:answer) { 3.times { create(:answer, answer_body: "Test",question: question)}}

      scenario "Have Follow User Button" do
        signin_user( user, user.password )
        first(:link, "Question 1").click

        expect(page).to have_selector(:link_or_button, 'Follow User')
      end

      scenario "Have Follow Topic Button" do
        signin_user( user, user.password )
        first(:link, "Question 1").click

        expect(page).to have_selector(:link_or_button, 'Follow Topic')
      end

      scenario "Have Answers" do
        signin_user( user, user.password )
        first(:link, "Question 1").click

        expect(page).to have_css("li span.answer")
      end
    end
  end
end
