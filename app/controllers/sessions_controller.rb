class SessionsController< ApplicationController
    def new

    end
    def create
        user = User.find_by(name: params[:user][:name])
        return redirect_to 'sessions/new' unless user.try(:authenticate, params[:user][:password])
        session[:user_id] = user.id
        @user = user
    end

    def destroy 
        session.delete :name
    end
end