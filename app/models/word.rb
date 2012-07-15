class Word < ActiveRecord::Base

  attr_accessible :meaning, :name, :sentence

  has_many :progresses, :dependent => :destroy
  has_many :users, :through => :progresses

end
