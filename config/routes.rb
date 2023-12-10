Rails.application.routes.draw do
  # Subscriptions
  get "subscriptions/new"
  get "subscriptions/checkout"

  # Onboarding
  get "onboarding", to: "onboarding#index"
  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"

  # Devise
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    unauthenticated do
      root to: "static_pages#index"
    end

    authenticated do
      root to: "dashboard#index", as: :authenticated_root
    end
  end

  # Good Job admin dashboard
  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => "good_job"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
end
