class User < ActiveRecord::Base
  enum role: [:subscriber, :client, :editor, :researcher]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :subscriber
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
end
