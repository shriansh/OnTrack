class UserMailer < ApplicationMailer

  include Resque::Mailer

   default from: 'ontrack@shriansh.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ontrack.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def daily_summary_email(user)
    @my_board = PersonalBoard.where(user_id: user.id).first
    @my_board_array = PersonalBoard.where(user_id: user.id).first.members
    @my_board_ids_array = PersonalBoard.where(user_id: user.id).first.member_ids
    @goals = Goal.all
    @notes = DailyNote.all
    @user = user
    @url  = 'http://ontrack.herokuapp.com'
    @subject = "hello"
    @subject = @user.first_name.capitalize.to_s + ", your personal board summary for "+Date.today.to_s
    mail(to: @user.email, subject: @subject)
  end






  def nudge_email(email_details)
    @recipient = email_details[0]
    @sender = email_details[1]

    @my_board = PersonalBoard.where(user_id: @sender.id).first
    @my_board_array = PersonalBoard.where(user_id: @sender.id).first.members
    @my_board_ids_array = PersonalBoard.where(user_id: @sender.id).first.member_ids
    @goals = Goal.all
    @notes = DailyNote.all
    @user = @recipient
    @url  = 'http://ontrack.herokuapp.com'
    @sub = @recipient.first_name.to_s.capitalize + ", " + @sender.first_name.to_s.capitalize + " sent you a nudge!"
    mail(to: @user.email, subject: @sub)

  end

 def hi5_email(email_details)
    @recipient = email_details[0]
    @sender = email_details[1]

    @my_board = PersonalBoard.where(user_id: @sender.id).first
    @my_board_array = PersonalBoard.where(user_id: @sender.id).first.members
    @my_board_ids_array = PersonalBoard.where(user_id: @sender.id).first.member_ids
    @goals = Goal.all
    @notes = DailyNote.all
    @user = @recipient
    @url  = 'http://ontrack.herokuapp.com'
    @sub = @recipient.first_name.to_s.capitalize + ", " + @sender.first_name.to_s.capitalize + " sends you a high five!!"
    mail(to: @user.email, subject: @sub)

  end


end
