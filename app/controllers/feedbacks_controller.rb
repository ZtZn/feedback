class FeedbacksController < ApplicationController
 
  def new
    @feedback = Feedback.new
    authorize @feedback
    @user = UserDecorator.decorate(current_user)
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
    @feedbacks = Feedback.search(params[:search]).page(params[:page])
    authorize @feedbacks
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :text, :search)
  end
end
