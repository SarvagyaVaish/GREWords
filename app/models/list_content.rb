class ListContent < ActiveRecord::Base
  attr_accessible :word_id, :word_list_id
  
  belongs_to :word_list
  belongs_to :word
  
  validates_uniqueness_of :word_list_id, :scope => :word_id
  
end
