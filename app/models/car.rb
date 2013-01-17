class Car < ActiveRecord::Base
  attr_accessible :make, :model, :year

  with_options :presence => true do |u|
    u.validates :year,
      :numericality => { :only_integer => true }
    u.validates :make
    u.validates :model
  end
end
