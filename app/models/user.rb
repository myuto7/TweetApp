class User < ApplicationRecord
    validates :email, {uniqueness: true, presence: true}
    validates :name, {presence: true}
    validates :password, {presence: true}
    def posts
        return Post.where(user_id: self.id)
    end
    has_secure_password
end