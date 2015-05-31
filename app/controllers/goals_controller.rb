class GoalsController < ApplicationController


before_action :auth_check, :only => [:destroy, :update, :edit, :show]

def auth_check
  @goal = Goal.find(params[:id])

 if @goal.user_id != current_user.id
    redirect_to root_url, :alert => "unauthorised"
  end

end


  def index
    @goals = Goal.all
  end

  def home
    @new_goal = Goal.new
    @new_note =DailyNote.new
    @notes = current_user.daily_notes
    @goals = current_user.goals

    @todays_goals = @goals.where(duedate: Date.today.to_s(:db))
    @tomorrows_goals = @goals.where(duedate: Date.tomorrow.to_s(:db))
    @todays_and_past_goals = @goals.where.not(duedate: Date.tomorrow.to_s(:db))

    if @goals == nil
      render 'new_home'
    else
      render 'home'
    end

  end




  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new
    @goal.recurringday = params[:recurringday]
    @goal.recurring = params[:recurring]
    @goal.stretch = params[:stretch]
    @goal.goaloneliner = params[:goaloneliner]
    @goal.complete = params[:complete]
    @goal.duedate = params[:duedate]
    @goal.user_id = current_user.id
    #change above to goal user id

    if @goal.save
      redirect_to "/", :notice => "Goal created successfully."
    else
      render 'new'
    end
  end


  def quick_add
    @goal = Goal.new
    @goal.stretch = false
    @goal.goaloneliner = params[:goaloneliner]
    @goal.complete = false
    @goal.duedate = Date.tomorrow.to_s(:db)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to "/", :notice => "Goal created successfully."
    else
      render 'home', :notice => "something went wrong."
    end
  end


  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    @goal.recurringday = params[:recurringday]
    @goal.recurring = params[:recurring]
    @goal.stretch = params[:stretch]
    @goal.goaloneliner = params[:goaloneliner]
    @goal.complete = params[:complete]
    @goal.duedate = params[:duedate]

    if @goal.save
      redirect_to "/", :notice => "Goal updated successfully."
    else
      render 'edit'
    end
  end

def complete
    @goal = Goal.find(params[:id])

    @goal.complete = true


    if @goal.save
      redirect_to "/", :notice => "Great job!"
    else
      redirect_to "/", :notice => "something went wrong"
    end
  end



  def destroy
    @goal = Goal.find(params[:id])

    @goal.destroy

    redirect_to "/", :notice => "Goal deleted."
  end
end
