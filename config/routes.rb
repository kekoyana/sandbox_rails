Rails.application.routes.draw do
  resource :homes, only: %w[show]
end
