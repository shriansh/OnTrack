class DailyNotesController < ApplicationController
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
    @daily_note.user_id = params[:user_id]

    if @daily_note.save
      redirect_to "/daily_notes", :notice => "Daily note created successfully."
    else
      render 'new'
    end
  end

  def add

    @daily_note = DailyNote.new
    @daily_note.note = params[:note]
    @daily_note.user_id = 1

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
