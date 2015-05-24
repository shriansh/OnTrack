class Goal < ActiveRecord::Base

  validates :goaloneliner, :presence => true
  belongs_to :user

end
