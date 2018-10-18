Rails.application.routes.draw do
  #Se define el renombramiento de los controladores y acciones
  get "index", to: "inicio#index"
  get 'students/:student_id/index', to: 'students#index', as: :student_index
  get 'students/:student_id/schedules/index', to: 'schedules#index', as: :student_schedule

  get 'students/:student_id/monitorings/ver', to: 'monitorings#ver', as: :ver_student_monitoring
  get 'students/:student_id/monitorings/inscribir', to: 'monitorings#inscribir', as: :inscribir_student_monitoring
  post 'students/:student_id/monitorings/inscribir', to: 'monitorings#inscribir', as: :inscribir_student_monitoring_post
  get 'students/:student_id/monitorings/index', to: 'monitorings#index'
  get 'students/:student_id/monitorings/contracts', to: 'monitorings#contracts', as: :contract_student_monitoring

  post 'academics/students/:student_id/schedules', to: 'academics/students/schedules#index', as: :schedule_materias_academics
  get 'academics/students/:student_id/schedules/historial', to: 'academics/students/schedules#historial', as: :historial_schedule_student
  post 'academics/students/:student_id/schedules/historial', to: 'academics/students/schedules#chistorial', as: :create_historial_schedule_student

  get 'academics/groups/index', as: :academic_group
  get 'academics/schedules/index', as: :academic_schedule
  get 'academics/students/index', to: 'academics/students#index', as: :academic_student
  post 'academics/students/new', to: 'academics/students#create'
  get 'academics/students/schedules/index', to: 'academics/students/schedules#index'
  post 'academics/groups/new', to: 'academics/groups#create'

  post 'academics/subjects/new', to: 'academics/subjects#create'
  get 'teachers/index'


  get 'registers/', to: 'registers#index'
  get 'registers/students/:student_id/notes', to: 'registers/students/notes#index'
  get 'registers/students/:student_id/notes/:note_id/edit', to: 'registers/students/notes#edit'
  get 'registers/students/:student_id/notes/new', to: 'registers/students/notes#new'
  #get 'registers/students/:student_id', to: 'registers/students#show'
  delete 'registers/students/:student_id/notes/:note_id', to: 'registers/students/notes#destroy', as: :destroy_note_student_registers
  post 'registers/students/:student_id/notes/new', to: 'registers/students/notes#create', as: :new_registers_student_note
  post 'registers/students/:student_id/notes/:note_id/edit', to: 'registers/students/notes#update', as: :update_registers_student_note
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

  #GET - SE PUEDE ACCEDER DESDE LAS RUTAS DESDE LA BARRA DE DIRECCIONES
  #POST - EL MAS SEGURO. SOLO SE PUEDE ACCEDER A TRAVES DE LINKS Y ACCIONES DE LA WEB


  #Definicio de recursos 

  resources :teachers
  
  resources :students do
    resources :schedules
    resources :monitorings
  end
  
  resources :resources do
    resources :teachers
  end

  #CURSOS, HORARIOS, SALONES, MATRICULAS
  namespace :academics do
    resources :subjects
    resources :students do
      scope module: :students do 
        resources :schedules
      end
    end
    resources :groups
  end
  resources :academics
  
  namespace :registers do
    resources :students do
      scope module: :students do
        resources :notes
      end
    end
  end
  resources :registers

  #deinifion de la ruta de arranque del servidor web
  root 'inicio#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
