class HomeController < ApplicationController

  def index

    @messages = WhatsNewMessage.where('expiration_date > ?', Time.now)

    if Word.count > 0 && current_user && current_user.words.count == 0
      flash[:notice] = "Welcome #{current_user.name}! To get you started we are adding 10 random words to the Learn list."
      current_user.lists.find_by_list_type('learn').words << current_user.random_unseen_words(10)
    end

    respond_to do |format|
      format.html #index.html.erb
    end

  end

#    respond_to do |format|
#      format.html { redirect_to contents_list_url(current_user.lists.find_by_list_type('learn')) }
#    end

end
