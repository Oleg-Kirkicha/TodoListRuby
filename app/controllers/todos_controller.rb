class TodosController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.todos.create(text: params[:text], done: false)
    redirect_to root_path
  end

  def destroy
    current_user.todos.find(params[:id]).destroy
    redirect_to root_path
  end

  def toggle
    todo = current_user.todos.find(params[:id])
    todo.update(done: !todo.done)
    redirect_to root_path
  end
end