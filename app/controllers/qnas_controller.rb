class QnasController < ApplicationController
  def index
    respond_with(@qnas = Qna.approved)
  end

  def show
    respond_with(@qna = Qna.approved.find(params[:id]))
  end
end
