class TodosController < ApplicationController
  def index
    api_client = ApiClient.new
    @todos = api_client.get_all_todos
  end

  def new
  end

  def create
    api_client = ApiClient.new
    response = api_client.create_todo(api_params)
    if response["id"] == 201
      redirect_to root_path, notice: "TODO was created: #{response}"
    else
      redirect_to new_todo_path, alert: "There was a problem creating your TODO."
    end
  end

  private

  def api_params
    params.permit(:user_id, :title, :completed)
  end
end
