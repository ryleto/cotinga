class MessageMailer < ApplicationMailer
    default from: "Cotinga <noreply@cotinga.com>"
    default to: "Recipient Name <recipient@gmail.com>"

    def new_message(message)
        @message = message
        mail subject: "Message from #{message.name}"
    end
end
