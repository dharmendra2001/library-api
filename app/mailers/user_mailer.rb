class UserMailer < ApplicationMailer
    default from: 'rathored2001.com'

    def welcome_email
    
      @url  = 'http://example.com/login'
      @user = params[:user]
      mail(to: @user.email, subject: 'Welcome to library abc')
      # mail(to: '0127cs191001@gmail.com', subject: 'Welcome to library abc')
    end
end
