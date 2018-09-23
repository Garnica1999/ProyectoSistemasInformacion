Rails.application.routes.draw do
  

  namespace :estudiante do
    get 'monitoria/index'
    get 'monitoria/inscribir'
    get 'monitoria/ver'
  end

  namespace :estudiante do
    get 'horario/index'
    get 'horario/inscribir'
    get 'horario/ver'
    get 'horario/materias_disponibles'
  end

  #GET - SE PUEDE ACCEDER DESDE LAS RUTAS DESDE LA BARRA DE DIRECCIONES
  #POST - EL MAS SEGURO. SOLO SE PUEDE ACCEDER A TRAVES DE LINKS Y ACCIONES DE LA WEB
  get 'inicio/index'
  get 'estudiante/index'
  
  #Se define el renombramiento de los controladores y acciones
  get "inicio", to: "inicio#index"


  #Definicio de recursos 
  resources :horario
  resources :monitoria
  resources :estudiante

  #deinifion de la ruta de arranque del servidor web
  root 'inicio#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
