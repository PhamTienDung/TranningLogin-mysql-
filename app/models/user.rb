class User < ApplicationRecord
    has_secure_password
    attr_accessor :remove_image
    after_save :purge_image, if: :remove_image
    private def purge_image
      image.purge_later
    end
    has_one_attached :image

    def self.search(search)
        if search
          where('name LIKE ?', "%#{search}%")
        else
          all
        end
      end
      private
end