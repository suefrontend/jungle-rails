class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        user = find_by(email: email.strip.downcase)
        return user if user&.authenticate(password)
        nil
    end
end
