Rails.application.routes.draw do
  resources :employees
  resources :cities
  

  get 'manager' => 'employees#manager'
  get 'relocation_requests' => 'employees#relocation_requests'
 
  post "employee_city" => "employees#employee_city", as: :employee_city

  root :to => "employees#manager"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
