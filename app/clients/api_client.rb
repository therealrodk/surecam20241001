class ApiClient
  def get_all_todos
    require "uri"
    require "net/http"

    url = URI("https://jsonplaceholder.typicode.com/todos")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    JSON.parse(response.read_body)
  end

  def create_todo(api_params)
    require "uri"
    require "json"
    require "net/http"

    url = URI("https://jsonplaceholder.typicode.com/todos")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = JSON.dump({
                               "userId": api_params[:user_id],
                               "title": api_params[:title],
                               "completed": api_params[:completed]
                             })

    response = https.request(request)
    JSON.parse(response.read_body)
  end

  def remove_todo(id)
    require "uri"
    require "net/http"

    url = URI("https://jsonplaceholder.typicode.com/todos/#{id}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Delete.new(url)

    response = https.request(request)
    response.code
  end
end
