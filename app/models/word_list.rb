class WordList < ActiveRecord::Base
  
  attr_accessible :list_type, :name, :user_id

  belongs_to :user
  has_many :list_contents
  has_many :words, :through => :list_contents

end
