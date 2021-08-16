class Article < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 10}
    validates :body, presence: true, length: { minimum: 15}
    validates :title, uniqueness: true
end
