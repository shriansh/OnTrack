class PersonalBoardsController < ApplicationController
  def index
    @personal_boards = PersonalBoard.all
  end

  def show
    @personal_board = PersonalBoard.find(params[:id])
  end

  def new
    @personal_board = PersonalBoard.new
  end

  def create
    @personal_board = PersonalBoard.new
    @personal_board.boardmember5 = params[:boardmember5]
    @personal_board.boardmember4 = params[:boardmember4]
    @personal_board.boardmember3 = params[:boardmember3]
    @personal_board.boardmember2 = params[:boardmember2]
    @personal_board.boardmember1 = params[:boardmember1]
    @personal_board.user = params[:user]

    if @personal_board.save
      redirect_to "/personal_boards", :notice => "Personal board created successfully."
    else
      render 'new'
    end
  end

  def edit
    @personal_board = PersonalBoard.find(params[:id])
  end

  def update
    @personal_board = PersonalBoard.find(params[:id])

    @personal_board.boardmember5 = params[:boardmember5]
    @personal_board.boardmember4 = params[:boardmember4]
    @personal_board.boardmember3 = params[:boardmember3]
    @personal_board.boardmember2 = params[:boardmember2]
    @personal_board.boardmember1 = params[:boardmember1]
    @personal_board.user = params[:user]

    if @personal_board.save
      redirect_to "/personal_boards", :notice => "Personal board updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @personal_board = PersonalBoard.find(params[:id])

    @personal_board.destroy

    redirect_to "/personal_boards", :notice => "Personal board deleted."
  end
end
