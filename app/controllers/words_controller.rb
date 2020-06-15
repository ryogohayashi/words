class WordsController < ApplicationController

  def index
    @words = Word.new
    @groups = Group.find(params[:group_id])
    @word = @groups.words.rank(:row_order).includes(:user)
    respond_to do |format|
      format.html
      format.csv { send_data render_to_string, filename: "words.csv", type: :csv }
    end
    @user = User.find(current_user[:id])
    @group = @user.groups.order(created_at: "DESC").includes(:user)
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
  end

  def update
    word = Word.find(params[:id])
    word.update(word_params)
    redirect_to action: 'index'
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

  def sort
    word = Word.find(params[:word_id])
    word.update(word_params)
    render body: nil 
  end

  private
  def word_params
    params.require(:word).permit(:word, :meaning, :row_order_position).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
