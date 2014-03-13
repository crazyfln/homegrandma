class NotificationMailer < ActionMailer::Base
  default from: "notifier@#{ENV['HOSTNAME']}"

  # Email to reply user after send us a contact form
  # -------------------------------------------------------
  def new_contact_reply(contact_us_id)
    @contact_us = ContactUs.find contact_us_id
    mail({
      to:       @contact_us.email,
      subject:  "Thank you for contacting us"
    })
  end

  def view_contact_reply(message_id)
    @message  = Message.find message_id
    @property = @message.property
    @owner    = @property.user

    mail({
      to:       @owner.email,
      subject:  "New Message for your facility"
    })
  end

end
