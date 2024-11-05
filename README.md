# Instaleap-ThecnicalTest
Repositorio para presentasiòn de challenge tècnico instaleap

Challenge técnico Instaleap.

Realicé el reto técnico corto por temas de tiempo. como la API de las movies no tenia data para filtrar por categorias, tome la inciativa de reemplazar esta parte por una pequeña implementación de almacenamiento local de movies favoritas usando Realm, esta es la unica libreria externa que uno en el proyecto.

# Applicación

Instalación.

Clonar el repositorio y abrir el archivo InstaFlix.xcworkspace esperar que indexe todos los files y se descarge el paquete de realm y lanzar la applicación.

# Arquitectura.

Quise generar una arquitectura algo modular en donde realice una separacion de los modulos o capas que quise emplear en el proyecto y los cree como Paquetes de SPM, tambien quise  aplicar practicas de clean aquitecture donde las capas superiores no dependan directamente de las capas inferiores y veceversa.

# Módulo Networking. 
InstaNetworking: Este módulo se encarga de manejar la logica del de la creación de los request para el llamado a una API REST, tiene una orientación a resultados, en donde se puede generar un manejo de errores que devuelva la API de forma simple. Esta Lib solo es usada por la lib de InstaFlixData.

# Módulo de Data.
InstaFlixData: Este Paquete lo cree con el objetivo de que aquí se tengan los objetos de acceso a datos como lo son Modelos de API, Repositorios, mappers de modelos de data hacia dominio o viceversa, la creacion de request para obtener la data usando el paquete de InstaFlixNetworking.

# Módulo de Dominio
InstaFlixDomain: este modulo o lib lo pense en como el corazoón del dominio del proyecto aqui el objetivo es que se definan los contratos o protocols de los repositories, Modelos de Dominio y reglas de dominio que se requiera en el proyecto y de esta manera mantener este paquete muy alineado a como lo es el dominio del negocio. 

# Módulo de presentacion 
InstaFlix: Este es el modulo de UI  este módulo se realizo con UIKit para la creación de vista de forma programatica, soy conciente de que la UI del Proyecto no es la mejor pero me quise enfocar más como en la parte de arquitectura.
Para este módulo o paquete, internamente para cada feature de la app se usa VIPER como patron de presentación, use VIPER por la sepracion de responsabilidades que genera, ademas de que si la aplicación empeiza a crecer en funcionalidades me puede facilitar el reusar algunos modulos que ya esten creados de una forma faicl, separa la responsabilidad de navegación del VC y de esta manera no generar tanto acoplamiento entre los diferentes actores que interactuan en viper. 

Para manejar las vistas de tabla implemente un tambleViewGeneico, que permita registrar un tipo de celda, y con esto pude reusar bastante còdigo para la presentacion de la vista de las movies y la vista de los tvShows.

# Buenas practias usadas.
Uso de protocolos para no generar acoplamiento directo y facilitar la inyección de dependencias.
creacion de extensiones para algnas clases de UI y así no duplicar mucho código. ejemplo en la aplicación de constrains.
se aplico los princios SOLID
uso de genericos en la vista para crear un componente reutilizable de lista.
Pruebas unitarias.
uso minimo de third party libraries

# Patrones de diseño.
Use un patron repositorio para el acceso y a datos desde la API y la data que se obtiene desde localStorage con Realm.
Use un especie de patron Adapter para hacer el mappeo de los modelos de API  a modelos de negocio y de la capa de dominio hacia arriba trabajar con modelos de Dominio

# Testing
Realice pruebas unitarias a la capa de data y a la capa de presentancion a los presenters, tambien genera un file de pruebas de integracion entre el presenter y el interactor y la vista.


Nota:

Me indicaron que cambiara los endpoints a unos a los siguieentes.

Películas
https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY

Series
https://api.themoviedb.org/3/tv/popular?api_key=YOUR_API_KEY

Entonces aproveche para hacer estos cambios de tambien agregar la creaciòn de la pantalla de los TVShows.

Adjunto link de un video del funcionamiento de la prueba sin el cambio de endpoints.

https://drive.google.com/file/d/1Cv3lDldbuBM_Ghz7-H9b8WPAO2YU_ZkP/view?usp=sharing


Adjunto link de un video del funcionamiento de la prueba con el cambio de endpoints en device.

https://drive.google.com/file/d/1iH6W0gexF7KcKAdb1LdsLpQXPgs1--nd/view?usp=sharing

Adjunto link de un video del funcionamiento de la prueba con el cambio de endpoints en simulador.
https://drive.google.com/file/d/1O15nJ6AbxrLSgSjKav-ZIiLEksiHLHbm/view?usp=sharing

Muchas gracias. 

