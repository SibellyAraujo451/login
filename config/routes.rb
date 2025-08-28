Rails.application.routes.draw do
  # Rotas de configuração
  get "settings/show"
  get "settings/update"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Página pública
  root to: "home#index"

  # Devise para usuários com controllers personalizados
  devise_for :users, controllers: {
    sessions: 'users/sessions',      # Para salvar email com remember_me
    passwords: 'users/passwords'     # Para personalizar forgot password
  }

  # Página privada
  get "dashboard", to: "dashboard#index", as: :dashboard
end
