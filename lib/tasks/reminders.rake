namespace :reminders do
  desc "TODO"
  task daily: :environment do


    users = User.all

    users.each do |user|

      puts "user is "
      puts user.email.to_s

      my_board = PersonalBoard.where(user_id: user.id).first



        puts "my board is:"
        puts my_board.to_s

        @my_board_array = my_board.members
        puts  @my_board_array.to_s

        @my_board_ids_array = my_board.member_ids
        puts @my_board_ids_array

        @goals = Goal.all
        @notes = DailyNote.all
        @user = user

        UserMailer.daily_summary_email(@user).deliver!
        puts "user mailer called ok; restarting loop"




    end



  end








  desc "TODO"
  task weekly: :environment do
  end

  desc "TODO"
  task monthly: :environment do
  end

end
