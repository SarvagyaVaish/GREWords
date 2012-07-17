class User < ActiveRecord::Base

  attr_accessible :email, :provider, :name

  has_many :progresses, :dependent => :destroy
  #has_many :words, :through => :progresses
  has_many :word_lists, :dependent => :destroy
  has_many :list_contents, :through => :word_lists
  has_many :words, :through => :list_contents
  
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

  def create_new_learn_test_lists
    WordList.create(:user_id => id, :list_type => "learn", :name => "Learn")
    WordList.create(:user_id => id, :list_type => "test", :name => "Test")
  end

end
