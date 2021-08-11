class User < ApplicationRecord
    has_secure_password
    def self.search(search)
        if search
          where('name LIKE ?', "%#{search}%")
        else
          all
        end
      end
      private
end