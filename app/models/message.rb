class Message
    include ActiveModel::Model
    attr_accessor :name, :email, :company, :subject, :content
    validates :name, :email, :subject, :content, presence: true
end
