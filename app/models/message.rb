class Message
    include ActiveModel::Model
    attr_accessor :name, :email, :content
    validates_presence_of :name, :email, :content
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
