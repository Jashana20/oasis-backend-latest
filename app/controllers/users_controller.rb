class UsersController < ApplicationController

    def sign_in
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            mood = Mood.all
            render json: {user: UserSerializer.new(user), token: generate_token({id: user.id}), mood: mood }
        else
            render json: {message: "log in failed"}
        end
    end
    

    def validate 
        user = user_from_token
        if user
            mood = Mood.all
            render json: {user: UserSerializer.new(user), token: generate_token({id: user.id}), mood: mood }
        else 
            render json: {message: "log in failed"}  
        end 

    end

    # def initial_data
    #     user = user_from_token

    #     if user # If token is valid
    #         # Get all information needed from that user
    #         entries = Entry.find_by(params[:user_id] === user.id)
    #         moods = Mood.all
            
    #         render json: { 
    #             entries: entries, 
    #             moods: moods,
    #         }
    #     else
    #         render json: { error: "You must be signed in to see this information" }
    #     end
    # end


    def index
        users = User.all
        render json: users
    end

    def showAnswers
        user = User.find_by(id: params[:id])
        answers = user.entries.last.answers
        render json: answers
    end 

    def create
        user = User.create(user_param)
        mood = Mood.all
        render json: { user: UserSerializer.new(user), token: generate_token({id: user.id}), mood: mood, user_id: user.id }
    end

    private
    def user_param
        params.require(:user).permit(:username, :password, :email)
    end

end
