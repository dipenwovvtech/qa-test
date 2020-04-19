require 'rails_helper'

feature 'Topic', type: :feature do
  let!(:topic) { create(:topic, name: 'Rails') }
  let!(:question) { create(:question, topic: topic)}
  let!(:user) { create(:user)}

  context 'question page' do
    context 'with answer' do
      let!(:answer) { create(:answer, question: question) }
      scenario 'follow topic with success' do
        signin_user(user, user.password)
        visit question_path(question)
        first(:button, "Follow Topic").click

        expect(page).to have_content("You have followed Rails")
      end

      scenario 'follow topic with failure alert' do
        signin_user(user, user.password)
        visit question_path(question)
        first(:button, "Follow Topic").click
        visit question_path(question)
        first(:button, "Follow Topic").click

        expect(page).to have_content("Already following.")
      end
    end

    context 'without answer' do
      let!(:answer) { create(:answer, question: question) }
      scenario 'follow topic with success' do
        signin_user(user, user.password)
        visit question_path(question)
        first(:button, "Follow Topic").click

        expect(page).to have_content("You have followed Rails")
      end

      scenario 'follow topic with failure alert' do
        signin_user(user, user.password)
        visit question_path(question)
        first(:button, "Follow Topic").click
        visit question_path(question)
        first(:button, "Follow Topic").click

        expect(page).to have_content("Already following.")
      end
    end
  end
end
