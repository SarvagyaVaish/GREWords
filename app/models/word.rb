class Word < ActiveRecord::Base

  attr_accessible :meaning, :name, :sentence

  has_many :progresses, :dependent => :destroy
  has_many :users, :through => :progresses
  has_and_belongs_to_many :word_lists

  def self.random
    c = count
    flag = 0
    word = find(:first)
    begin
      flag = flag + 1
      word = find(:first, :offset => rand(c))
    end while word.nil? && flag < 500
    word
  end

end
