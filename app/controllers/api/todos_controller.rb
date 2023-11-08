module Api
  class TodosController < ApplicationController
    def index
      @todos = Todo.includes(:user).all
    end

    def create
      @todo = Todo.new(create_params)

      if @todo.save
        render 'api/todos/show', formats: [:json], handlers: [:jbuilder]
      else
        render json: { errors: @todo.errors, status: :unprocessable_entity }
      end
    end

    def update
      @todo = Todo.find(params[:id])
      if @todo
        @todo.update(update_params)
        render 'api/todos/show', formats: [:json], handlers: [:jbuilder]
      else
        render json: { errors: 'Data not found', status: :not_found }
      end
    end

    def show
      @todo = Todo.includes(:user).find(params[:id])
    end

    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      render json: { message: 'Todo deleted' }
    end

    private

    def create_params
      params.permit(:title, :description, :due_date, :status, :user_id)
    end

    def update_params
      params.permit(:title, :description, :due_date, :status, :user_id)
    end
  end
end