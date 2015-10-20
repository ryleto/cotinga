class Article < ActiveRecord::Base
    has_many :comments, as: :commentable
    default_scope -> { order(pubdate: :desc) }
end
