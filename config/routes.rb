Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', :sign_up => "register"  }
	root 'doctors#dashboard'
	get '/admin', to: 'doctors#dashboard'
  resources :disease_infos

  resources :treatments
  
  resources :patients do
  	get 'show_disease_info_list', on: :member
  end
  
  resources :doctors do
    get 'all_patient_list', on: :member 
    collection do
      get 'update_specialist'
      get 'update_cities'
    end
  end
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
