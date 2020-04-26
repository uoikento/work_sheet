class QuestionsController < ApplicationController
  
  before_action :login_check, {only: [:new, :create]}
  
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
      counts = Vote.where(question_id: @question).where(option_id: o).count
      begin
        calc_counts = counts * 100 / @votes_sum
      rescue
        return @vote_sum
      end
      @vote_sum << calc_counts
    end
    @vote_title = @option.pluck("title")
    vote_hash = [@vote_title, @vote_sum].transpose
    @vote_result = Hash[*vote_hash.flatten]
  end

  private
  def question_params
    params.require(:question).permit(:title, options_attributes: [:id, :title]).merge(user_id: current_user.id)
  end

  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end

