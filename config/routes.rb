Rails.application.routes.draw do
  namespace 'v1' do
    resources :users
    resources :work_records
    resources :category
  end
end
