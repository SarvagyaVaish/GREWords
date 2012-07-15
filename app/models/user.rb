require 'digest'
class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation
  attr_accessor :password

  has_many :progresses, :dependent => :destroy
  has_many :words, :through => :progresses

  validates :email, :uniqueness => true
  validates :password, :confirmation => true,
                       :presence => true,
		       :if => :password_required?
  
  before_save :encrypt_new_password

  def password_required?
    hashed_password.blank? || password.present?
  end
 
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = Digest::SHA1.hexdigest(password)
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == Digest::SHA1.hexdigest(password)
  end

end
