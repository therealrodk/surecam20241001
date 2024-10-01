json.extract! comment, :id, :body, :post_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
json.body comment.body.to_s
