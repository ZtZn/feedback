class FeedbacksController < ApplicationController
  #paginates_per 10

  def new
    @feedback = Feedback.new
    authorize @feedback
  end

  def create
    interactor = CreateFeedback.call(feedback_params: feedback_params, user: current_user)
    if interactor.success?
      redirect_to root_path, notice: "Feedback was successfully send!"
    else
      render :new
    end
  end

  def index
    @feedbacks = Feedback.search(params[:search])
    authorize @feedbacks
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text, :search)
  end
end
