class UserMailer < ApplicationMailer

   default from: 'ontrack@shriansh.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://ontrack.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def daily_summary_email(current_user)
    @my_board = PersonalBoard.where(user_id: current_user.id).first
    @my_board_array = PersonalBoard.where(user_id: current_user.id).first.members
    @my_board_ids_array = PersonalBoard.where(user_id: current_user.id).first.member_ids
    @goals = Goal.all
    @notes = DailyNote.all
    @user = current_user
    @url  = 'http://ontrack.herokuapp.com'
    sub = current_user.first_name.capitalize.to_s + ", your personal board summary for "+Date.today.to_s
    mail(to: @user.email, subject: sub)
  end



end
