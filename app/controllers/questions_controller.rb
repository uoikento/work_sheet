class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.options.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @option = @question.options

    # 選択肢のレコードの数
    @count = @option.count

    # 回答数
    @votes_sum = Vote.where(question_id: @question).count

    # @vote_sum = count_vote(@question).count
  end

  private
  def question_params
    params.require(:question).permit(:title, options_attributes: [:id, :title]).merge(user_id: current_user.id)
  end
end
