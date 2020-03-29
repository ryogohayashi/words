class WordsController < ApplicationController
  #before_action :move_to_index, except: [:index, :search]

  def index
    @group = Group.find(params[:group_id])
    @words = @group.words
  end

  def new
    @words = Word.new
  end

  def create
    @words = Word.create(word_params)
    redirect_to group_words_path
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
