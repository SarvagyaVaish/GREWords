class ListContent < ActiveRecord::Base
  attr_accessible :word_id, :list_id
  
  belongs_to :list
  belongs_to :word
  
  #validates_uniqueness_of :list_id, :scope => :word_id
  
end
