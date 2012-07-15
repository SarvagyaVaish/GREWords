class Progress < ActiveRecord::Base

  attr_accessible :points, :user_id, :word_id, :mode

  belongs_to :user
  belongs_to :word

  validates_uniqueness_of :user_id, :scope => :word_id

  scope :learnMode, where(:mode => 0)
  scope :testMode, where(:mode => 1)

end
