class MessageMailer < ApplicationMailer
    default from: "Cotinga <noreply@cotinga.com>"
    default to: "Contact Name <first.last@domain.com>"

    def new_message(message)
        @message = message
        
        mail subject: "Message from #{message.name}"
    end
end
