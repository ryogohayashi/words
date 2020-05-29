class WordsController < ApplicationController
  #before_action :move_to_index, except: [:index, :search]

  def index
    @words = Word.new
    @word = Word.all.order(created_at: "DESC").includes(:user)
    @groups = Group.new
    @group = Group.all.order(created_at: "DESC").includes(:user)
  end

  def new
    @words = Word.new
  end

  def create
    @words = Word.create(word_params)
    if @words.save
      respond_to do |format|
        format.json { render json: @words }
        format.html { redirect_to action: 'index' }
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    word = Word.find(params[:id])
    word.update(word_params)
    redirect_to group_words_path
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    redirect_to group_words_path
  end

  def search
    @words = Word.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def word_params
    params.require(:word).permit(:word, :meaning, :sentence, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
