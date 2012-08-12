class List < ActiveRecord::Base

  attr_accessible :list_type, :name, :user_id

  belongs_to :user
  has_many :list_contents, :dependent => :destroy

  has_many :words, :through => :list_contents

  def nextWord
    leastScore = ListContent.where(:list_id => id).order('points').first.points
    nextWordId = ListContent.where(:list_id => id, :points => leastScore).sample.word_id
    return Word.find(nextWordId)
  end

  def updateLearnScore(word)
    listContent = ListContent.where(:list_id => id, :word_id => word.id).first
    listContent.points = listContent.points + 1+(2*rand).round
    listContent.save
  end

  def updateTestScore(wordId, learnStatus)
    listContent = ListContent.where(:list_id => id, :word_id => wordId).first
    if learnStatus == 'true'
      listContent.points = listContent.points + 150+(5*rand).round
      listContent.save
    end
    if learnStatus == 'false'
      listContent.points = listContent.points + 10+(2*rand).round
      listContent.save
    end
  end

end
