class UserMailer < ActionMailer::Base
  def welcome_mail(user)
    recipients    user.email
    from          "Andolasoft Library."
    subject       "Congratulation "+user.name
    sent_on       Time.now
    body          (:message=>"your username is  #{user.username} and your password is #{user.password}" ,:url => "http://localhost:3000/")
  end
 

end
