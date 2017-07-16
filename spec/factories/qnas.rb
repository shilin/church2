FactoryGirl.define do
  sequence(:qna_question) { |n| "Question#{n}" }
  sequence(:qna_answer) { |n| "Answer#{n}" }

  factory :approved_qna, class: Qna do
    sequence(:name) { |n| "Asker#{n}" }
    question { generate :qna_question }
    answer { generate :qna_answer }
    approved true
  end

  factory :not_approved_qna, class: Qna do
    sequence(:name) { |n| "Asker#{n}" }
    question 'not approved question'
    answer { generate :qna_answer }
    approved false
  end
end
