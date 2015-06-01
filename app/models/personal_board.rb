class PersonalBoard < ActiveRecord::Base

  has_many :users


  def member_ids

    member_id_array = []
    member_id_array.push(boardmember1_id.to_s)
    member_id_array.push(boardmember2_id.to_s)
    member_id_array.push(boardmember3_id.to_s)
    member_id_array.push(boardmember4_id.to_s)
    member_id_array.push(boardmember5_id.to_s)
    member_id_array.push(user_id.to_s)
    member_id_array.reject!{|c| c.empty?}

    return member_id_array

  end


  def members

    member_array = []
    member_array.push(boardmember1)
    member_array.push(boardmember2)
    member_array.push(boardmember3)
    member_array.push(boardmember4)
    member_array.push(boardmember5)

    member_array.reject!{|c| c.empty?}

    return member_array
  end











end
