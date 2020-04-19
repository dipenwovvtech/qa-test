require 'rails_helper'

feature 'User', type: :feature do
  let!(:question_creator) { create(:user, name: "Questionnaire 1") }
  let!(:question) { create(:question, user: question_creator) }
  let!(:answer_user) { create(:user) }

  context 'Questions' do
    context 'with answer' do
      let!(:answer) { create(:answer, question: question) }

      scenario "follow question creator with success" do
        signin_user(answer_user, answer_user.password)
        visit question_path(question)
        first(:button, "Follow User").click

        expect(page).to have_content("You have followed Questionnaire 1")
      end

      scenario "follow question creator with failure alert(already following)" do
        signin_user(answer_user, answer_user.password)
        visit question_path(question)
        first(:button, "Follow User").click
        visit question_path(question)
        first(:button, "Follow User").click

        expect(page).not_to have_content("You have followed Questionnaire 1")
        expect(page).to have_content("Already following.")
      end
    end
  end
end
