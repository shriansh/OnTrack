class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def home
    @goals = Goal.all
    @todays_goals = Goal.where(duedate: Date.today.to_s(:db))
    @tomorrows_goals = Goal.where(duedate: Date.tomorrow.to_s(:db))
    @todays_and_past_goals = Goal.where.not(duedate: Date.tomorrow.to_s(:db))
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

    if @goal.save
      redirect_to "/goals", :notice => "Goal created successfully."
    else
      render 'new'
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

    redirect_to "/goals", :notice => "Goal deleted."
  end
end
