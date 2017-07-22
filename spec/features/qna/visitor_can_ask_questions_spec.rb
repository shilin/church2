# encoding: utf-8
require_relative '../feature_helper'

feature 'User can ask questions', '
  In order to know more about lutherans
  As a visitor
  I want to be able to ask questions
' do

  let!(:approved_qnas) { create_list(:approved_qna, 2) }
  let!(:not_approved_qnas) { create_list(:not_approved_qna, 2) }

  before { visit qnas_path }

  scenario 'Visitor can submit a vaild answer', js: true do
    within '#ask-question' do
      fill_in 'qna_name', with: 'Vasya'
      fill_in 'qna_question', with: 'My very good question'
      click_on 'Задать вопрос'
    end

    expect(page).to have_content 'Спасибо за вопрос!'
  end

  scenario 'Visitor tries to submit an invaild answer', js: true do
    within '#ask-question' do
      fill_in 'qna_name', with: nil
      fill_in 'qna_question', with: nil
      click_on 'Задать вопрос'
    end

    expect(page).to have_content 'question: is too short'
    expect(page).to have_content 'name: can\'t be blank'
    expect(page).to have_content 'question: can\'t be blank'
  end
end
