class MoodsController < ApplicationController

    def index
        moods = Mood.all 
        render json: moods 
    end

    def show
        mood = Mood.find(params[:id])
        render json: mood
    end 

    def create
        mood = Mood.create(todo_param)
        render json: mood
    end

    private
    def mood_param
        params.require(:mood).permit(:name)
    end

end
