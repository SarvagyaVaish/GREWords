class ListsController < ApplicationController

  load_and_authorize_resource

  rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid

  # GET /lists/1/add_to_list
  def add_to_list
    @from_list = current_user.lists.find(params[:id])
    if @from_list.list_type == 'learn'
      @to_list = current_user.lists.find_by_list_type('test')
    elsif @from_list.list_type == 'test'
      @to_list = current_user.lists.find_by_list_type('learn')
    end
    @word = Word.find(params[:word_id])

    @to_list.words << @word
    @from_list.words.destroy(@word)

    respond_to do |format|
      format.html { redirect_to :action => "next" }
      format.json { render json: @lists }
    end
  end

  # GET /lists/1/add_words
  def add_words
    @list = current_user.lists.find(params[:id])
    @list.words << current_user.random_unseen_words(5)

    respond_to do |format|
      format.html { redirect_to :action => "contents" }
      format.json { render json: @lists }
    end
  end

  # GET /lists/1/next
  def next
    @list = current_user.lists.find(params[:id])
    if @list.words.count == 0
      redirect_to :action => 'contents'
      return true
    end

    if @list.list_type == "learn"
      @word = @list.nextWord
      @list.updateLearnScore(@word)
    elsif @list.list_type == 'test' 
      if params[:learnStatus]
        @list.updateTestScore(params[:wordId], params[:learnStatus])
      end
      @word = @list.nextWord
    end

    respond_to do |format|
      format.html # next.html.erb
      format.json { render json: @word }
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
    @lists = List.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  # GET /lists/new.json
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(params[:list])

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
    @list = List.find(params[:id])

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
    @list = List.find(params[:id])
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
