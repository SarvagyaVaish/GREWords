class WhatsNewMessagesController < ApplicationController
  # GET /whats_new_messages
  # GET /whats_new_messages.json
  def index
    @whats_new_messages = WhatsNewMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @whats_new_messages }
    end
  end

  # GET /whats_new_messages/1
  # GET /whats_new_messages/1.json
  def show
    @whats_new_message = WhatsNewMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @whats_new_message }
    end
  end

  # GET /whats_new_messages/new
  # GET /whats_new_messages/new.json
  def new
    @whats_new_message = WhatsNewMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @whats_new_message }
    end
  end

  # GET /whats_new_messages/1/edit
  def edit
    @whats_new_message = WhatsNewMessage.find(params[:id])
  end

  # POST /whats_new_messages
  # POST /whats_new_messages.json
  def create
    @whats_new_message = WhatsNewMessage.new(params[:whats_new_message])

    respond_to do |format|
      if @whats_new_message.save
        format.html { redirect_to @whats_new_message, notice: 'Whats new message was successfully created.' }
        format.json { render json: @whats_new_message, status: :created, location: @whats_new_message }
      else
        format.html { render action: "new" }
        format.json { render json: @whats_new_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /whats_new_messages/1
  # PUT /whats_new_messages/1.json
  def update
    @whats_new_message = WhatsNewMessage.find(params[:id])

    respond_to do |format|
      if @whats_new_message.update_attributes(params[:whats_new_message])
        format.html { redirect_to @whats_new_message, notice: 'Whats new message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @whats_new_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /whats_new_messages/1
  # DELETE /whats_new_messages/1.json
  def destroy
    @whats_new_message = WhatsNewMessage.find(params[:id])
    @whats_new_message.destroy

    respond_to do |format|
      format.html { redirect_to whats_new_messages_url }
      format.json { head :no_content }
    end
  end
end
