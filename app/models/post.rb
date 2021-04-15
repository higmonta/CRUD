class Post < ApplicationRecord
    validates :title, presence:true
    validates :body, presence:true, length: {maximum: 140}, length: {minimum: 5}
    has_many :comments
end
