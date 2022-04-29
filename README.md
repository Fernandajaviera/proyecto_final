# Proyecto Veterinaria

## Instalación Heroku

* Clonar repositorio
`git clone https://github.com/Fernandajaviera/proyecto_final/`

* Instalar Heroku-cli
`curl https://cli-assets.heroku.com/install-ubuntu.sh | sh`

* Iniciar sesión en Heroku
`heroku login`

* Configurar app de heroku con repositorio
`heroku git:remote -a proyectofinalfernanda`

* Push de proyecto hacia Heroku
`git push heroku main`

* Ejecutar migraciones y seeds
`heroku run rake db:migrate`
`heroku run rake db:seed`

* Añadir subdominio
`heroku domains:add fer.chaucha.cl`

## Instalación local (testing)

* Clonar repositorio
`git clone https://github.com/Fernandajaviera/proyecto_final/`

* Instalar paquetes de Gemfile
`bundle install`

* Crear base de datos
`rails db:create`

* Ejecutar migraciones
`rails db:migrate`

* Cargar seeds de prueba
`rails db:seed`

* Correr servidor de rails
`rails s`