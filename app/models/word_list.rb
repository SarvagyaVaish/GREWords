class WordList < ActiveRecord::Base
  attr_accessible :name, :type, :user_id
end
