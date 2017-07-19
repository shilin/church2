class QnasController < ApplicationController
  respond_to :js, :json

  def index
    respond_with(@qnas = Qna.approved)
  end

  def show
    respond_with(@qna = Qna.approved.find(params[:id]))
  end

  def create
    respond_with(@qna = Qna.create(qna_params))

    # render json: { id: @votable.id, rating: @votable.rating, message: "#{model_klass} has been successfully upvot" }
    # render json: { id: @votable.id, message: 'Unable to upvote' }, status: :unprocessable_entity
  end

  private

  def qna_params
    params.require(:qna).permit(:name, :question)
  end
end
