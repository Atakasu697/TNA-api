module V1
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

    def index
      users = User.order(created_at: :desc)
      render json: {status: 'SUCCESS', message: 'Loaded users', data: users}
    end

    def show
      render json: {status: 'SUCCESS', message: 'Loaded the user', data: @user}
    end

    def create
      logger.debug('===============test log create================')
      user = User.new(user_params)
      logger.debug(user)
      if user.save
        render json: {states: 'SUCCESS', data: user}
      else
        render json: {status: 'ERROR', data: user.errors}
      end
    end

    def destroy
      @user.destroy
      render json: {status: 'SUCCESS', message: 'Deleted the user', data: @user}
    end

    def update
      if @user.update(user_params)
        render json: {status: 'SUCCESS', message: 'Updated the user', data: @user}
      else
        render json: {status: 'ERROR', message: 'Not updated', data: @user.errors }
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:name)
    end
  end
end
