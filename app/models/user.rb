class User < ActiveRecord::Base

  attr_accessible :email, :provider, :name

  has_many :progresses, :dependent => :destroy
  has_many :lists, :dependent => :destroy
  
  has_many :list_contents, :through => :lists
  has_many :words, :through => :list_contents
  
  #has_many :words, :through => :progresses

  after_create :create_new_learn_test_lists

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def unseen_words
    all_words = Word.all
    unseen_words = all_words - self.words
  end

  def create_new_learn_test_lists
    List.create(:user_id => id, :list_type => "learn", :name => "Learn")
    List.create(:user_id => id, :list_type => "test", :name => "Test")
  end

end
