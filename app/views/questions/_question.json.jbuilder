json.extract! question, :id, :name, :user_id, :topic_id, :slug, :created_at, :updated_at
json.url question_url(question, format: :json)
