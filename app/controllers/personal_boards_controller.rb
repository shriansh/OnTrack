class PersonalBoardsController < ApplicationController
  def index
    @personal_boards = PersonalBoard.all
  end

  def my_board
    @my_board = PersonalBoard.where(user_id: current_user.id).first
    @my_board_array = PersonalBoard.where(user_id: current_user.id).first.members
    @my_board_ids_array = PersonalBoard.where(user_id: current_user.id).first.member_ids
  end

  def show
    @personal_board = PersonalBoard.find(params[:id])
  end

  def new
    @personal_board = PersonalBoard.new
  end

 def new_my_board
    @personal_board = PersonalBoard.new
  end



  def create
    @personal_board = PersonalBoard.new
    @personal_board.boardmember5_id = params[:boardmember5]
    @personal_board.boardmember4_id = params[:boardmember4]
    @personal_board.boardmember3_id = params[:boardmember3]
    @personal_board.boardmember2_id = params[:boardmember2]
    @personal_board.boardmember1_id = params[:boardmember1]

    @personal_board.boardmember5 = User.find(params[:boardmember5].to_i).username
    @personal_board.boardmember4 = User.find(params[:boardmember4].to_i).username
    @personal_board.boardmember3 = User.find(params[:boardmember3]).username
    @personal_board.boardmember2 = User.find(params[:boardmember2]).username
    @personal_board.boardmember1 = User.find(params[:boardmember1]).username

    @personal_board.user = current_user.username
    @personal_board.user_id=current_user.id
    @personal_board.user_id = current_user.id

    if @personal_board.save
      redirect_to "/personal_boards", :notice => "Personal board created successfully."
    else
      render 'new'
    end
  end


def edit_my_board

  @personal_board = PersonalBoard.where(user_id: current_user.id).first

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
