class HomeController < ApplicationController

  def index

    @messages = WhatsNewMessage.find_all_by_status(true)

    if current_user && current_user.words.count == 0
      flash[:notice] = "Welcome #{current_user.name}! To get you started we are adding 10 random words to the Learn list."
      (1..10).each do
        current_user.lists.find_by_list_type('learn').words << Word.random
        logger.debug Word.random
      end
    end

    respond_to do |format|
      format.html #index.html.erb
    end

  end

#    respond_to do |format|
#      format.html { redirect_to contents_list_url(current_user.lists.find_by_list_type('learn')) }
#    end

end
