class Contact < ApplicationMailer

  def send_contact(textbook, current_user, message)
    @textbook = textbook
    @current_user = current_user
    @message = message
    mail(
      from: "#{@current_user.name} <#{@current_user.email}>",
      to: @textbook.user.email,
      subject: "I would like to buy #{@textbook.title}",
      reply_to: @current_user.email,
    )
  end
end
