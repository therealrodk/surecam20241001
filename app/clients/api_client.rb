class ApiClient
  require "uri"
  require "net/http"

  BASE_URL = "https://jsonplaceholder.typicode.com/todos"

  def get_all_todos
    url = URI(BASE_URL)

    request_type = "get"

    response = make_request(url, request_type)
    JSON.parse(response.read_body)
  end

  def create_todo(api_params)
    require "json"

    url = URI(BASE_URL)

    request_type = "post"
    request_body = JSON.dump({
      userId: api_params[:user_id],
      title: api_params[:title],
      completed: api_params[:completed]
    })

    response = make_request(url, request_type, request_body)
    JSON.parse(response.read_body)
  end

  def remove_todo(id)
    url = URI(BASE_URL + "/#{id}")
    request_type = "delete"

    response = make_request(url, request_type)
    response.code
  end

  private

  def make_request(url, request_type, request_body = "")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = case request_type
    when "get"
      Net::HTTP::Get.new(url)
    when "post"
      Net::HTTP::Post.new(url)
    when "delete"
      Net::HTTP::Delete.new(url)
    end

    request["Content-Type"] = "application/json" if request_type == "post"

    if request_body.present?
      request.body = request_body
    end

    https.request(request)
  end
end
