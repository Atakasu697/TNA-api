module V1
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :update, :destroy]

    def index
      categorys = Category.order(created_at: :desc)
      render json: {status: 'SUCCESS', message: 'Loaded categorys', data: categorys}
    end

    def show
      render json: {status: 'SUCCESS', message: 'Loaded the category', data: @category}
    end

    def create
      category = Category.new(category_params)
      logger.debug(category)
      if category.save
        render json: {states: 'SUCCESS', data: category}
      else
        render json: {status: 'ERROR', data: category.errors}
      end
    end

    def destroy
      @category.destroy
      render json: {status: 'SUCCESS', message: 'Deleted the category', data: @category}
    end

    def update
      if @category.update(category_params)
        render json: {status: 'SUCCESS', message: 'Updated the category', data: @category}
      else
        render json: {status: 'ERROR', message: 'Not updated', data: @category.errors }
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.permit(:name)
    end
  end
end
