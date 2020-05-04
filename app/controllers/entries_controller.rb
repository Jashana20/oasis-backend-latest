class EntriesController < ApplicationController

    def index 
        entries = Entry.all
        render json: entries
    end 

    def show 
        entry = Entry.find(params[:id])
        render json: entry, include: [:mood, :user]
    end 

    def create
        entry = Entry.create(entry_params)
        if (entry.valid?)
            params[:questions].map{|question| Answer.create(entry_id: entry.id, question_id:  question["question_id"], question_answer: question["question_answer"])} 
        render json: entry
        else 
        render json: {error: "error"}
        end
    end
    
    def update
        entry = Entry.find(params[:id])
        entry.update(journal_entry: params[:journal_entry])
        render json: entry, include: [:mood, :user]
    end
    
    def destroy
        entry = Entry.find(params[:id])
        entry.destroy
    end
 
    # :user_id,


    private 
    def entry_params
        params.require(:entry).permit(:journal_entry, :user_id, :mood_id)
    end 
end
