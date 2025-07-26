class TodosController < ApplicationController

    def create
      Todo.create(text: params[:text], done: false)
      redirect_to root_path
    end
  
    def destroy
      Todo.find(params[:id]).destroy
      redirect_to root_path
    end
  
    def toggle
      todo = Todo.find(params[:id])
      todo.update(done: !todo.done)
      redirect_to root_path
    end
  end
  