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

  def upload
  end
  
  private
  def question_params
    params.require(:question).permit(:title,options_attributes: [:title]).merge(user_id: current_user.id)
  end
end
