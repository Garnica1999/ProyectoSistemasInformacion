# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( index.css 
	inicio.css 
	font-awesome.min.css 
	horario.css 
	index-horario.css
	jquery-ui.min.css
	estudiante/estudiante.css
	estudiante/index-estudiante.css
	estudiante/login-horario.css
	estudiante/inscribir-horario.css
	estudiante/ver-horario.css
	estudiante/materias_disponibles.css
	estudiante/login-monitoria.css
	estudiante/inscribir-monitoria.css
	estudiante/ver-monitoria.css
)
