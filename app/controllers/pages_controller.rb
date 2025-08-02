class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @todos = current_user.todos
  end
end