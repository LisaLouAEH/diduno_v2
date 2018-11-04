class UsersController < ApplicationController
    def index 
    end
    def new 
        @user = User.create()
    end
    def create
    end
    def show 
        @user = User.find(params[:id])
    end
    def update 
    end
    def destroy
    end
end
