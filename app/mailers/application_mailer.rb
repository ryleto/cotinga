class ApplicationMailer < ActionMailer::Base
  default from: "Cotinga App <noreply@cotinga.com>"
  default to: "inbox@cotinga.com"
  append_view_path Rails.root.join('app', 'views', 'mailers')
end
