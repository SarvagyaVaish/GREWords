class Word < ActiveRecord::Base

  attr_accessible :meaning, :name, :sentence

  has_many :progresses, :dependent => :destroy
  has_many :users, :through => :progresses
  has_many :list_contents
  has_many :lists, :through => :list_contents

  def self.random
    c = count
    flag = 0
    word = find(:first)
    begin
      flag = flag + 1
      word = find(:first, :offset => rand(c))
    end while word.nil? && flag < c*c
    word
  end

end
