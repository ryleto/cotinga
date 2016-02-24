class Article < ActiveRecord::Base
    has_many :comments, as: :commentable
    default_scope -> { order(pubdate: :desc) }
    acts_as_taggable
    validates :pubdate, :title, :source, :presence => true
    validates :title, :source, :uniqueness => true
    validates :source, :format => URI::regexp(%w(http https))
end
