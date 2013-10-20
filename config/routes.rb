FowaBackbone::Application.routes.draw do
  scope ':username' do
    resources :notes, only: [:index, :show, :create, :update, :destroy]
  end
end
