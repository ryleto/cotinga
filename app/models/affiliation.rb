class Affiliation < ActiveRecord::Base
    has_many :users
    validates :company, presence: true
    validates :company_id, uniqueness: true
end
