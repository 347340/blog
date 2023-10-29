Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # 允许来自任何域的请求，根据需求进行调整
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
