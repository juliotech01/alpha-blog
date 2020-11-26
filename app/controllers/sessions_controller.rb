class SessionsController < ApplicationController
    
    def new
    
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Login realizado com sucesso!"
            redirect_to user
        else
            flash.now[:alert] = "Tem alguma coisa errado com os detalhes do seu login."
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logout realizado com sucesso!"
        redirect_to root_path
    end
end