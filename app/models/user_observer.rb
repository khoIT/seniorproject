class UserObserver < ActiveRecord::Observer
    def after_save(user)
        Rails.logger.info "User password confirmed!"
        if user.confirmed_at_changed?
          #send email
          UserMailer.welcome(user).deliver
        end
    end
end
