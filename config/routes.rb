Rails.application.routes.draw do
  namespace 'v1' do
    resources :categories
    resources :users
    resources :work_records
  end
end
