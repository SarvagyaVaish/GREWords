class User < ActiveRecord::Base

  attr_accessible :email, :provider, :name, :uid

  has_many :progresses, :dependent => :destroy
  has_many :lists, :dependent => :destroy
  
  has_many :list_contents, :through => :lists
  has_many :words, :through => :list_contents
  
  #has_many :words, :through => :progresses

  after_create :create_new_learn_test_lists

  def self.from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first
    send_email = false
    if  user.nil?
      user = User.create(auth.slice(:provider, :uid))
      send_email = true
    end
    user.provider = auth.provider
    user.email = auth.info.email
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token unless auth.provider == 'developer'
    user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.provider == 'developer'
    user.save!
    
    (1..10).each do 
      UserMailer.welcome_email(user).deliver if send_email
    end
    user
  end

  def unseen_words
    all_words = Word.all
    unseen_words = all_words - self.words
  end

  def random_unseen_word
    contender_words = unseen_words
    c = contender_words.count
    if c == 0 
      return nil
    else
      word = contender_words[rand(c)]
    end
  end

  def create_new_learn_test_lists
    List.create(:user_id => id, :list_type => "learn", :name => "Learn")
    List.create(:user_id => id, :list_type => "test", :name => "Test")
  end

  def admin?
    if admin
      return true
    else
      return false
    end
  end

end
