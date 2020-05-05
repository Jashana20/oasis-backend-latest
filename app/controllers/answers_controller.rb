class AnswersController < ApplicationController
    def index 
        answers = Answer.all
        render json: answers
    end 

    def show 
        answer = Answer.find(params[:id])
        render json: answer
    end 

    def create
        answer = Answer.create(answer_params)
        if (answer.valid?)
        render json: answer
        else 
        render json: {error: "error"}
        end
    end

    def user_answers 
        user_answers = Answer.map{|answer| }
    end 
    
    # def update
    #     answer = Answer.find(params[:id])
    #     answer.update(journal_entry: params[:journal_entry])
    #     render json: answer, include: [:mood, :user]
    # end
    
    # def destroy
    #     entry = Entry.find(params[:id])
    #     entry.destroy
    # end

    private 
    def answer_params
        params.require(:answer).permit(:question_answer, :question_id, :entry_id)
    end 
end
