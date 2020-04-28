class QuestionsController < ApplicationController

    def index 
        questions = Question.all
        render json: questions
    end 

    def show 
        question = Question.find(params[:id])
        render json: question
    end 

    def create
        question = Question.create(question_params)
        if (question.valid?)
        render json: question
        else 
        render json: {error: "error"}
        end
    end
 
    private 
    def question_params
        params.require(:question).permit(:question)
    end 
end
