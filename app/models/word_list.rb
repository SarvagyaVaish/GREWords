class WordList < ActiveRecord::Base
  attr_accessible :name, :type, :user_id, :word_id
end
