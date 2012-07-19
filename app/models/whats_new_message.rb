class WhatsNewMessage < ActiveRecord::Base
  attr_accessible :message, :title, :text, :user_specific, :expiration_date

  before_create :set_exp_date

  def set_exp_date
    self.expiration_date = Time.now + 7.days
  end

end
