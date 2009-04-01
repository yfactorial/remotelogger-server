require 'digest/sha2'

module Authentication
  module User
    
    module ClassMethods
      
      def digest(password, salt)
        Digest::SHA512.hexdigest("#{password}#{salt}")
      end
      
      def authenticate(email, password)
        u = find_by_email(email)
        return (u && u.crypted_password == digest(password, u.salt)) ? u : nil      
      end
    end
    
    module InstanceMethods
      
      def hash_password
        if password_changed?
          self.salt = ActiveSupport::SecureRandom.hex(10) if !salt
          self.crypted_password = self.class.digest(password, salt)
        end
      end
      
      def reset_password!
        self.password = self.password_confirmation = ActiveSupport::SecureRandom.hex(4)
        self.save
      end        
      
      def password_changed?
        new_record? or !password.blank? or !password_confirmation.blank?
      end
    end
  end
end
