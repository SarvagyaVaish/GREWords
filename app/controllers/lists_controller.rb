class ListsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid
  
  # GET /lists/1/add_words
  def add_words
    @list = current_user.lists.find(params[:id])
    (1..10).each do 
      @list.words << Word.random
    end

    respond_to do |format|
      format.html { redirect_to :action => "contents" }
      format.json { render json: @lists }
    end
  end
  
  # GET /lists/1/test_list
  def test_list
    @words = current_user.lists.find(params[:id]).words
    @word = @words[rand(@words.count)]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end
  
  # GET /lists/1/learn_list
  def learn_list
    @words = current_user.lists.find(params[:id]).words
    @word = @words[rand(@words.count)]
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end
  
  # GET /lists/1/contents
  def contents
    @list = current_user.lists.find(params[:id])
    @words = @list.words

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end
  
  # GET /lists
  # GET /lists.json
  def index
    @lists = WordList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = WordList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = WordList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = WordList.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = WordList.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Word list was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.json
  def update
    @list = WordList.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'Word list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list = WordList.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
      format.json { head :no_content }
    end
  end

  def record_invalid
    redirect_to :action => "contents"
  end

end
