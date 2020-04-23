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

    # 実験
    @option_ids = @option.pluck("id")
    @vote_sum = []
    @option.each do |o|
      @vote_sum << Vote.where(question_id: @question).where(option_id: o).count
    end
    @vote_title = @option.pluck("title")
    @vote_result = Hash[@vote_title, @vote_sum]
    # binding.pry
  end

  private
  def question_params
    params.require(:question).permit(:title, options_attributes: [:id, :title]).merge(user_id: current_user.id)
  end
end

