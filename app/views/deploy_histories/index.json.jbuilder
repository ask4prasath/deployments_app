json.array!(@deploy_histories) do |deploy_history|
  json.extract! deploy_history, :id, :name, :user, :history, :started_at, :ended_at, :status
  json.url deploy_history_url(deploy_history, format: :json)
end
