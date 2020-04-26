class VotesController < ApplicationController
  
  def new
    @vote = Vote.new
    @question = Question.find(params[:question_id])
    @options = Option.where(question_id: @question)
    
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      redirect_to root_path
    else
      # renderはアクションを通過しないため、変数定義が必要
      @question = Question.find(params[:question_id])
      @options = Option.where(question_id: @question)
      render :new
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:role, :option_id).merge(question_id: params[:question_id])
  end

end
