Rails.application.routes.draw do
  
  get 'students/:student_id/monitorings/ver', to: 'monitorings#ver', as: :ver_student_monitoring
  get 'students/:student_id/monitorings/inscribir', to: 'monitorings#inscribir', as: :inscribir_student_monitoring
  post 'students/:student_id/monitorings/inscribir', to: 'monitorings#inscribir', as: :inscribir_student_monitoring_post
  get 'students/:student_id/monitorings/index', to: 'monitorings#index'
  devise_for :students, controllers: {
    registrations: 'students/registrations',
    sessions: 'students/sessions'}

  devise_scope :student do
    authenticate :student do
      #root 'students#index', as: :authenticate_student_root
    end

    authenticated :student do
      #RUTA PARA USUARIOS QUE YA INICIARON SESION
      #root 'students#index', as: :authenticated_student_root
    end

    unauthenticated :student do
      #RUTA PARA USUARIOS QUE NO HAN INICIADO SESION
      #root 'students/sessions#new', as: :unauthenticated_student_root
      #root 'inicio#index', as: :unauthenticated_student_root
    end
  end


  devise_for :teachers, controllers: {
    registrations: 'teachers/registrations',
    sessions: 'teachers/sessions'}

  namespace :registros do
    get 'students/index'
    get 'students/ver'
  end

  #GET - SE PUEDE ACCEDER DESDE LAS RUTAS DESDE LA BARRA DE DIRECCIONES
  #POST - EL MAS SEGURO. SOLO SE PUEDE ACCEDER A TRAVES DE LINKS Y ACCIONES DE LA WEB
  get 'inicio/index'
  get 'students/index'
  get 'students/ver'
  get 'teachers/index'
  get 'schedules/index'
  get 'schedules/ver'

  #Definicio de recursos 
  resources :students do
    resources :schedules
    resources :monitorings
  end

  resources :teachers
  
  #Se define el renombramiento de los controladores y acciones
  get "inicio", to: "inicio#index"

  #deinifion de la ruta de arranque del servidor web
  root 'inicio#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
