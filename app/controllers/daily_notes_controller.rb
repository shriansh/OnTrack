class DailyNotesController < ApplicationController


before_action :auth_check, :only => [:destroy, :update, :edit, :show]

def auth_check
  @daily_note = DailyNote.find(params[:id])

 if @daily_note.user_id != current_user.id
    redirect_to root_url, :alert => "unauthorised"
  end

end






  def index
    @daily_notes = DailyNote.all
  end

  def show
    @daily_note = DailyNote.find(params[:id])
  end

  def new
    @daily_note = DailyNote.new
  end

  def create
    @daily_note = DailyNote.new
    @daily_note.note = params[:note]
    @daily_note.user_id = current_user.id

    if @daily_note.save
      redirect_to "/daily_notes", :notice => "Daily note created successfully."
    else
      render 'new'
    end
  end



  def add

    @daily_note = DailyNote.new
    @daily_note.note = params[:note]
    @daily_note.user_id = current_user.id

    if @daily_note.save
      redirect_to "/", :notice => "Daily note created successfully."
    else
      render 'new'
    end

  end



  def edit
    @daily_note = DailyNote.find(params[:id])
  end

  def update
    @daily_note = DailyNote.find(params[:id])

    @daily_note.note = params[:note]
    @daily_note.user_id = params[:user_id]

    if @daily_note.save
      redirect_to "/daily_notes", :notice => "Daily note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @daily_note = DailyNote.find(params[:id])

    @daily_note.destroy

    redirect_to "/daily_notes", :notice => "Daily note deleted."
  end
end
