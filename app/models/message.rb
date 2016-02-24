class Message
    include ActiveModel::Model
    attr_accessor :name, :company, :email, :content
    validates :name, :email, :content, presence: true
    validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, message: "not a valid email" }
end
