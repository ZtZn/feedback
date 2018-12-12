class CreateFeedback
  include Interactor

  def call
    feedback = Feedback.new(context.feedback_params)
    feedback.user = context.user
    if feedback.save
      send_email(feedback)
      context.feedback = feedback
    else
      context.fail!
    end
  end

  private

  def send_email(feedback)
    AdminMailer.feedback(feedback).deliver_later
  end
end
