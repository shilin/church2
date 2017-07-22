require_relative '../feature_helper'

feature 'User can see qna', '
  In order to know more about lutherans
  As a visitor
  I want to be able to see questions with answers
' do

  let!(:approved_qnas) { create_list(:approved_qna, 2) }
  let!(:not_approved_qnas) { create_list(:not_approved_qna, 2) }

  scenario 'Visitor see questions with answers' do
    visit qnas_path

    within '#qnas' do
      %w(Asker Question Answer).each do |text|
        expect(page).to have_content(text, count: 2)
      end
    end
  end

  scenario 'Visitor do not see unapproved questions with answers' do
    visit qnas_path

    within '#qnas' do
      expect(page).to_not have_content('not approved question')
    end
  end
end
