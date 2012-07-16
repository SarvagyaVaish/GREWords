class Word < ActiveRecord::Base

  attr_accessible :meaning, :name, :sentence

  has_many :progresses, :dependent => :destroy
  has_many :users, :through => :progresses

  def self.random
    c = count
    begin
      word = find(:first, :offset => rand(c))
    end while word.nil?
    word
  end

end
