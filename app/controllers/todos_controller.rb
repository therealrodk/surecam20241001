class TodosController < ApplicationController
  before_action :set_api_client, except: :new
  def index
    @todos = @api_client.get_all_todos
  end

  def new
  end

  def create
    response = @api_client.create_todo(api_params)
    if response["id"] == 201
      redirect_to root_path, notice: "TODO was created: #{response}"
    else
      redirect_to new_todo_path, alert: "There was a problem creating your TODO."
    end
  end

  def destroy
    return unless params[:id].present?

    response = @api_client.remove_todo(params[:id])
    if response == "200"
      redirect_to root_path, notice: "TODO was deleted"
    else
      redirect_to new_todo_path, alert: "There was a problem deleting your TODO."
    end
  end

  private

  def set_api_client
    @api_client = ApiClient.new
  end

  def api_params
    params.permit(:user_id, :title, :completed)
  end
end
