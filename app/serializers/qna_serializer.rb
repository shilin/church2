# encoding: utf-8
class QnaSerializer < BaseSerializer
  attributes :name, :question, :answer, :message

  def message
    'Спасибо за вопрос!'
  end
end
