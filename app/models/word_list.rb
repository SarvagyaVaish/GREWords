class WordList < ActiveRecord::Base
  
  attr_accessible :list_type, :name, :user_id

  belongs_to :user

end
