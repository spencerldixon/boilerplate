Rails.application.routes.draw do
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

  authenticate :user, ->(user) { user.admin? } do
    mount GoodJob::Engine => "good_job"
  end

  get "onboarding", to: "onboarding#index"
  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"
end
