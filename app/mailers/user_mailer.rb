class UserMailer < ApplicationMailer

  def new_message_email(message)
    @message = message
    @sender  = message.user

    mail(to: @message.ad.user.email, from: @sender.email, subject: 'New Message Received')
  end

  def new_reply_email(reply)
    @reply   = reply
    @message = @reply.message
    @sender  = @reply.user

    mail(to: @message.user.email, from: @sender.email, subject: 'New Reply Received')
  end
end
