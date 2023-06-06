class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    def self.authenticate_with_credentials(email, password)
        stripped_email = email.strip.downcase
        user = User.where('lower(trim(email)) = ?', stripped_email).first
        if user&.authenticate(password)
          user
        else
          nil
        end
      end
end
