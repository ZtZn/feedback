class AdminMailer < ApplicationMailer
  layout "mailer"
  default from: RailsBase::Application.config.action_mailer.default_options[:from]

  def feedback(feedback)
    @feedback = feedback
    mail(to: @feedback.email, subject: 'feedback')
  end
end
