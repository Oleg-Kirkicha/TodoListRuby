require 'rails_helper'

RSpec.describe "Todos", type: :request do
  let(:user) do
    User.create!(email: "user_todos_#{SecureRandom.hex(4)}@example.com", password: "password")
  end

  let!(:todo) { user.todos.create!(text: "Buy milk", done: false) }

  before do
    post user_session_path, params: { user: { email: user.email, password: 'password' } }
  end
    describe "POST /todos" do
    it "creates a new todo for the current user" do
      expect {
        post todos_path, params: { text: "Buy bread" }
      }.to change(user.todos, :count).by(1)

      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE /todos/:id" do
    it "deletes the todo" do
      expect {
        delete todo_path(todo)
      }.to change(user.todos, :count).by(-1)

      expect(response).to redirect_to(root_path)
    end
  end

  describe "PATCH /todos/:id/toggle" do
    it "toggles the done field" do
      expect {
        patch toggle_todo_path(todo)
      }.to change { todo.reload.done }.from(false).to(true)

      expect(response).to redirect_to(root_path)
    end
  end
end
