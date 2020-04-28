class ApplicationController < ActionController::API

    def generate_token(data)
        JWT.encode(data, "secret")
    end

    def decode_token
        token = request.headers["Authorization"]
        begin 
            JWT.decode(token, "secret").first["id"]
        rescue
            {}
        end 
    end

    def user_from_token
        id = decode_token
        User.find_by(id)
    end

end
