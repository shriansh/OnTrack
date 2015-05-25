class PersonalBoard < ActiveRecord::Base


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
