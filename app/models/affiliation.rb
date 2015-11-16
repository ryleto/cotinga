class Affiliation < ActiveRecord::Base
    has_many :users
    validates :company, presence: true
end
