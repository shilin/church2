# encoding: utf-8
require_relative '../feature_helper'

feature 'User can ask questions', '
  In order to know more about lutherans
  As a visitor
  I want to be able to ask questions
' do

  let!(:approved_qnas) { create_list(:approved_qna, 2) }
  let!(:not_approved_qnas) { create_list(:not_approved_qna, 2) }

  scenario 'Visitor see questions with answers', js: true do
    visit qnas_path

    within '#ask-question' do
      fill_in 'qna_name', with: 'Vasya'
      fill_in 'qna_question', with: 'My very good question'
      click_on 'Задать вопрос'
    end

    expect(page).to have_content 'Спасибо за вопрос!'
  end
end
