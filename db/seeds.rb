# seeds.rb
require 'open-uri'

# Limpiar la base de datos antes de ejecutar los seeds en desarrollo
#if Rails.env.development?
  puts 'Cleaning database...'
  Purchase.destroy_all  # Eliminar todas las compras primero
  Course.destroy_all    # Luego eliminar todos los cursos
  Event.destroy_all     # También eliminar todos los eventos
  User.destroy_all      # Finalmente eliminar todos los usuarios
#end

#usuarios de compañeras
puts "Creando usuarios"

#CECILIA
user_1 = User.create!(email: 'cecilia@gmail.com', password: '123456', first_name: 'Cecilia', last_name: 'Orlando')
file = URI.open("https://avatars.githubusercontent.com/u/168267241?v=4")
user_1.photo.attach(io: file, filename: "cecilia.png", content_type: "image/png")
user_1.save!

#ALEJANDRA
user_2 = User.create!(email: 'alejandra@gmail.com', password: '123456', first_name: 'Alejandra', last_name: 'Gonzalez')
file = URI.open("https://avatars.githubusercontent.com/u/159148776?v=4")
user_2.photo.attach(io: file, filename: "alejandra.png", content_type: "image/png")
user_2.save!

#SOFÍA
user_3 = User.create!(email: 'sofia@gmail.com', password: '123456', first_name: 'Sofía', last_name: 'Torres')
file = URI.open("https://d26jy9fbi4q9wx.cloudfront.net/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBK1hOQWc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--b557299047e6b0a91c8380e2fa15c7490ace0b6d/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCem9MWm05eWJXRjBTU0lJYW5CbkJqb0dSVlE2RTNKbGMybDZaVjkwYjE5bWFXeHNXd2hwQWNocEFjaDdCam9KWTNKdmNEb09ZWFIwWlc1MGFXOXUiLCJleHAiOm51bGwsInB1ciI6InZhcmlhdGlvbiJ9fQ==--b67d9ded4d28d0969fbb98b4c21b79257705a99a/sophieblu.jpg")
user_3.photo.attach(io: file, filename: "sofia.png", content_type: "image/png")
user_3.save!

#Luis
user_4 = User.create!(email: 'luis@gmail.com', password: '123456', first_name: 'Luis', last_name: 'Barranzuela')
file = URI.open("https://avatars.githubusercontent.com/u/119614171?s=96&v=4")
user_4.photo.attach(io: file, filename: "luis.png", content_type: "image/png")
user_4.save!
puts "Usuarios creados"


#######Creando CURSOS#########
###CURSOS SOFI####
# CURSO 1
course_1 = Course.create!(
  name: " Nutrición y Bienestar",
  description: " Este curso está diseñado para mujeres interesadas en mejorar su salud y bienestar a través de la nutrición. A lo largo del curso, las participantes aprenderán sobre los principios de una alimentación equilibrada, la importancia de los nutrientes y cómo planificar comidas saludables. Se abordarán temas como la nutrición para diferentes etapas de la vida, la relación entre la alimentación y la salud mental, y cómo adoptar hábitos alimenticios sostenibles. Además, se proporcionarán herramientas para mejorar la educación nutricional y tomar decisiones informadas sobre la alimentación. Al finalizar el curso, las participantes tendrán un plan nutricional personalizado y las habilidades necesarias para mantener una alimentación saludable.",
  price: 110, user: user_3, category: "Nutrición")

#agregando IMG
puts "agregando IMG al curso #{course_1.name}"
file = URI.open("https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_1.photo.attach(io: file, filename: "nutricion.jpg", content_type: "image/jpg")
course_1.save!

# CURSO 2
course_2 = Course.create!(
  name: " Mindfulness y Meditación",
  description: " Este curso está diseñado para mujeres interesadas en aprender técnicas de mindfulness y meditación para mejorar su bienestar emocional y mental. A lo largo del curso, las participantes aprenderán los principios y prácticas del mindfulness, incluyendo la meditación guiada, la atención plena y la reducción del estrés. Se abordarán temas como la gestión del estrés, la mejora de la concentración y la promoción de la calma interior. Además, se proporcionarán herramientas para incorporar el mindfulness en la vida diaria y desarrollar una práctica de meditación sostenida. Al finalizar el curso, las participantes tendrán las habilidades necesarias para practicar mindfulness y meditación de manera independiente y para mejorar su bienestar emocional.",
  price: 100, user: user_3, category: "mindfulness")

#agregando IMG
puts "agregando IMG al curso #{course_2.name}"
file = URI.open("https://images.pexels.com/photos/3822774/pexels-photo-3822774.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1
")
course_2.photo.attach(io: file, filename: "mindfulnessymeditacion.jpg", content_type: "image/jpg")
course_2.save!


#CURSO 3

course_3 = Course.create!(
  name: "  Escritura Creativa",
  description: "  Este curso está diseñado para mujeres interesadas en desarrollar sus habilidades de escritura creativa. A lo largo del curso, las participantes aprenderán técnicas de escritura narrativa, poesía y guionismo. Se abordarán temas como la creación de personajes, la estructura narrativa y el uso del lenguaje figurado. Además, se fomentará la creatividad y la expresión personal a través de ejercicios de escritura y la lectura de obras literarias. Al finalizar el curso, las participantes tendrán un portafolio de escritos creativos y las habilidades necesarias para continuar desarrollando su escritura de manera independiente.",
  price: 120, user: user_3, category: "Escritura")

#agregando IMG
puts "agregando IMG al curso #{course_3.name}"
file = URI.open("https://images.pexels.com/photos/1394646/pexels-photo-1394646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_3.photo.attach(io: file, filename: "mindfulnessymeditacion.jpg", content_type: "image/jpg")
course_3.save!

#CURSO 4
course_4 = Course.create!(
  name: "Autoestima y Empoderamiento Femenino",
  description: " Este curso está diseñado para ayudar a las mujeres a desarrollar su autoestima y empoderamiento personal. A lo largo del curso, las participantes aprenderán sobre la importancia de la autoestima, cómo identificar y superar creencias limitantes y cómo desarrollar una mentalidad positiva. Se abordarán temas como la autocompasión, la resiliencia y la autoafirmación. Además, se proporcionarán herramientas para mejorar la autoconfianza y tomar decisiones empoderadas en la vida personal y profesional. Al finalizar el curso, las participantes tendrán las habilidades necesarias para cultivar una autoestima saludable y para sentirse más seguras y empoderadas en su vida diaria.",
  price: 100, user: user_3, category: "autoestima")

#agregando IMG
puts "agregando IMG al curso #{course_4.name}"
file = URI.open("https://images.pexels.com/photos/5885482/pexels-photo-5885482.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_4.photo.attach(io: file, filename: "autoestimayempoderamiento.jpg", content_type: "image/jpg")
course_4.save!

#CURSO 5
course_5 = Course.create!(
  name: "Costura Básica para Principiantes",
  description: "Este curso de costura básica está diseñado para mujeres que desean aprender las habilidades fundamentales de la costura. A lo largo de las sesiones, aprenderás a manejar una máquina de coser, a realizar diferentes tipos de puntadas y a confeccionar prendas simples como faldas y blusas. Los objetivos de aprendizaje incluyen el dominio de las técnicas básicas de costura, la comprensión de los patrones de costura y la capacidad de realizar reparaciones básicas en la ropa. Al final del curso, serás capaz de diseñar y crear tus propias prendas, promoviendo la autosuficiencia y la creatividad.",
  price: 50, user: user_3, category: "costura y tejido")

#agregando IMG
puts "agregando IMG al curso #{course_5.name}"
file = URI.open("https://images.pexels.com/photos/6461522/pexels-photo-6461522.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_5.photo.attach(io: file, filename: "costura.jpg", content_type: "image/jpg")
course_5.save!

#CURSO 6
course_6 = Course.create!(
  name: "Jardinería Urbana",
  description: " En este curso de jardinería urbana, aprenderás a cultivar tus propias plantas en espacios reducidos, como balcones y terrazas. El curso está diseñado para mujeres que buscan una conexión con la naturaleza y desean disfrutar de los beneficios de tener un jardín en casa. Los objetivos de aprendizaje incluyen la comprensión de los principios básicos de la jardinería, el conocimiento de las plantas adecuadas para espacios urbanos y las técnicas de cuidado y mantenimiento de un jardín. Al finalizar el curso, podrás crear y mantener tu propio jardín urbano, mejorando tu bienestar y contribuyendo al medio ambiente.",
  price: 45, user: user_3, category: "jardineria")

#agregando IMG
puts "agregando IMG al curso #{course_6.name}"
file = URI.open("https://images.pexels.com/photos/1105019/pexels-photo-1105019.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_6.photo.attach(io: file, filename: "jardineria.jpg", content_type: "image/jpg")
course_6.save!

### CURSOS DE ALE ###
#CURSO 7
course_7 = Course.create!(
  name: " Cocina Saludable",
  description: " Este curso de cocina saludable está diseñado para mujeres que desean aprender a preparar comidas nutritivas y deliciosas. A lo largo del curso, aprenderás sobre los principios de una dieta equilibrada, la selección de ingredientes frescos y la preparación de platos que promuevan la salud. Los objetivos de aprendizaje incluyen el desarrollo de habilidades culinarias, el conocimiento de técnicas de cocina saludable y la capacidad de planificar menús equilibrados. Al final del curso, podrás preparar una variedad de platos saludables para ti y tu familia, mejorando tu bienestar general.",
  price: 60, user: user_2, category: "cocina")

#agregando IMG
puts "agregando IMG al curso #{course_7.name}"
file = URI.open("https://images.pexels.com/photos/793765/pexels-photo-793765.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_7.photo.attach(io: file, filename: "cocina.jpg", content_type: "image/jpg")
course_7.save!

#CURSO 8

course_8 = Course.create!(
  name: "  Cerámica para Principiantes",
  description: "En este curso de cerámica para principiantes, aprenderás a trabajar con arcilla y a crear tus propias piezas de cerámica. El curso está diseñado para mujeres que desean explorar su creatividad a través de la artesanía. Los objetivos de aprendizaje incluyen el conocimiento de las técnicas básicas de modelado y esculpido, la comprensión del proceso de secado y horneado, y la capacidad de decorar y esmaltar tus creaciones. Al finalizar el curso, tendrás la habilidad de crear piezas únicas de cerámica, desde utensilios de cocina hasta objetos decorativos.",
  price: 55, user: user_2, category: "Cerámica")

#agregando IMG
puts "agregando IMG al curso #{course_8.name}"
file = URI.open("https://images.pexels.com/photos/7302803/pexels-photo-7302803.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_8.photo.attach(io: file, filename: "cocina.jpg", content_type: "image/jpg")
course_8.save!


#COURSE 9
course_9 = Course.create!(
  name: "Reparaciones Domésticas",
  description: "Este curso de reparaciones domésticas está diseñado para mujeres que desean aprender a realizar reparaciones básicas en el hogar. A lo largo del curso, aprenderás a manejar herramientas de reparación, a solucionar problemas comunes y a realizar mejoras en tu hogar. Los objetivos de aprendizaje incluyen el desarrollo de habilidades prácticas para el mantenimiento del hogar, el conocimiento de técnicas de reparación y la capacidad de manejar herramientas de manera segura. Al finalizar el curso, serás capaz de realizar reparaciones básicas y de mejorar la funcionalidad de tu hogar.",
  price: 40, user: user_2, category: "Cuidado de la casa")

#IMG
puts "agregando IMG al curso #{course_9.name}"
file = URI.open("https://images.pexels.com/photos/909256/pexels-photo-909256.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_9.photo.attach(io: file, filename: "reparaciones.jpg", content_type: "image/jpg")
course_9.save!


#COURSE 10
course_10 = Course.create!(
name: " Tejido a Mano",
description: "Este curso de tejido a mano está diseñado para mujeres que desean aprender las técnicas básicas y avanzadas de tejido. A lo largo del curso, aprenderás a tejer diferentes tipos de prendas y accesorios, utilizando diversas técnicas y patrones. Los objetivos de aprendizaje incluyen el dominio de las técnicas de tejido, la comprensión de los patrones y la capacidad de crear tus propias piezas de tejido. Al finalizar el curso, serás capaz de tejer una variedad de prendas y accesorios, promoviendo la creatividad y la autosuficiencia.",
price: 40, user: user_2, category: "costura y tejido")

#agregando IMG
puts "agregando IMG al curso #{course_10.name}"
file = URI.open("https://images.pexels.com/photos/10443162/pexels-photo-10443162.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
course_10.photo.attach(io: file, filename: "tejidoamano.jpg", content_type: "image/jpg")
course_10.save!


#COURSE 11
course_11 = Course.create!(
  name: "Introducción al Derecho",
  description: "Este curso de Introducción al Derecho está diseñado para mujeres que desean adquirir conocimientos básicos sobre el sistema legal y sus derechos. A lo largo del curso, aprenderás sobre los fundamentos del derecho, las diferentes ramas legales y cómo se aplican en la vida cotidiana. Los objetivos de aprendizaje incluyen la comprensión de los principios jurídicos básicos, el conocimiento de los derechos civiles y familiares, y la capacidad de interpretar y aplicar normas legales. Al finalizar el curso, estarás empoderada con el conocimiento necesario para tomar decisiones informadas y defender tus derechos.",
  price: 70, user: user_2, category: "Derecho")

  #agregando IMG
  puts "agregando IMG al curso #{course_11.name}"
  file = URI.open("https://images.pexels.com/photos/5668882/pexels-photo-5668882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
  course_11.photo.attach(io: file, filename: "introduccionalderecho.jpg", content_type: "image/jpg")
  course_11.save!


#COURSE 12

course_12 = Course.create!(
  name: " Cosmetología Científica",
  description: "Este curso de Cosmetología Científica está diseñado para mujeres que desean comprender la ciencia detrás del cuidado de la piel y los productos cosméticos. A lo largo del curso, aprenderás sobre la biología de la piel, la química de los ingredientes cosméticos y cómo elegir y usar productos de manera efectiva. Los objetivos de aprendizaje incluyen el conocimiento de la estructura y función de la piel, la capacidad de leer y entender las etiquetas de los productos cosméticos, y la formulación básica de productos de cuidado de la piel. Al finalizar el curso, podrás tomar decisiones informadas sobre el cuidado de tu piel y crear tus propios productos cosméticos naturales.",
  price: 75, user: user_2, category: "Cosmetología")

  #agregando IMG
  puts "agregando IMG al curso #{course_12.name}"
  file = URI.open("https://images.pexels.com/photos/4041392/pexels-photo-4041392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
  course_12.photo.attach(io: file, filename: "cosmetologíacientifica.jpg", content_type: "image/jpg")
  course_12.save!


###### EVENTOS #############

#EVENTOS DE SOFI
#EVENTO 1
puts "creando eventos"
event_1 = Event.create!(
  name: "Conferencia: Mujeres que Cambian el Mundo",
  description: "Únete a esta conferencia inspiradora donde mujeres líderes compartirán sus historias de éxito y cómo están cambiando el mundo desde diferentes ámbitos.",
  price: 30, user: user_3, status: "viernes 5 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_1.name}"
file = URI.open("https://images.pexels.com/photos/8145352/pexels-photo-8145352.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_1.photo.attach(io: file, filename: "muejerescambianmundo.jpg", content_type: "image/jpg")
event_1.save!

#EVENTO 2
event_2 = Event.create!(
  name: "Taller de Networking para Mujeres Profesionales",
  description: "Un taller interactivo diseñado para ayudar a las mujeres a expandir su red profesional, intercambiar experiencias y crear conexiones significativas.",
  price: 25, user: user_3, status: "jueves 4 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_2.name}"
file = URI.open("https://images.pexels.com/photos/1181263/pexels-photo-1181263.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_2.photo.attach(io: file, filename: "networkingmujeres.jpg", content_type: "image/jpg")
event_2.save!

#EVENTO 3
event_3 = Event.create!(
  name: "Feria de Emprendedoras",
  description: "Ven a conocer a mujeres emprendedoras que mostrarán sus productos y servicios innovadores. Una excelente oportunidad para apoyar negocios locales y conocer nuevos talentos.",
  price: 20, user: user_3, status: "viernes 5 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_3.name}"
file = URI.open("https://images.pexels.com/photos/5908756/pexels-photo-5908756.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_3.photo.attach(io: file, filename: "feriaemprendedoras.jpg", content_type: "image/jpg")
event_3.save!

#EVENTO 4
event_4 = Event.create!(
  name: "Panel de Debate: Avances y Retos del Feminismo",
  description: "Participa en un debate dinámico con expertas en feminismo que discutirán los avances logrados y los desafíos que aún enfrentamos en la lucha por la igualdad de género.",
  price: 20, user: user_3, status: "viernes 5 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_4.name}"
file = URI.open("https://images.pexels.com/photos/1267696/pexels-photo-1267696.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_4.photo.attach(io: file, filename: "debatefeminismo.jpg", content_type: "image/jpg")
event_4.save!

#EVENTOS DE ALE
#EVENTO 5
event_5 = Event.create!(
  name: "Encuentro de Arte y Cultura Femenina",
  description: "Disfruta de una exhibición de arte y cultura que celebra la creatividad y expresión femenina a través de diversas disciplinas artísticas.",
  price: 29, user: user_2, status: "viernes 5 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_5.name}"
file = URI.open("https://images.pexels.com/photos/36469/woman-person-flowers-wreaths.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_5.photo.attach(io: file, filename: "arteycultura.jpg", content_type: "image/jpg")
event_5.save!

#EVENTO 6
event_6 = Event.create!(
  name: "Charla Motivacional: Mujeres Inspiradoras",
  description: "Escucha a mujeres inspiradoras que compartirán sus historias de superación y éxito, motivando a las asistentes a perseguir sus sueños y alcanzar sus metas.",
  price: 15, user: user_2, status: "lunes 8 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_6.name}"
file = URI.open("https://images.pexels.com/photos/2041390/pexels-photo-2041390.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_6.photo.attach(io: file, filename: "mujeresinspiradoras.jpg", content_type: "image/jpg")
event_6.save!

#EVENTO 7
event_7 = Event.create!(
  name: "Curso Intensivo: Liderazgo y Empoderamiento",
  description: "Un curso intensivo diseñado para desarrollar habilidades de liderazgo y empoderamiento en mujeres, proporcionando herramientas prácticas para su desarrollo personal y profesional.",
  price: 35, user: user_2, status: "jueves 4 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_7.name}"
file = URI.open("https://images.pexels.com/photos/20606061/pexels-photo-20606061/free-photo-of-julia.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_7.photo.attach(io: file, filename: "liderazgoempoderamiento.jpg", content_type: "image/jpg")
event_7.save!

#EVENTO 8
event_8 = Event.create!(
  name: "Festival de Cine Dirigido por Mujeres",
  description: "Disfruta de una selección de películas dirigidas por mujeres, destacando la diversidad y el talento en la industria cinematográfica femenina.",
  price: 12, user: user_2, status: "lunes 8 de julio de 2024")
#IMG DE EVENTO
puts "agregando IMG al evento #{event_8.name}"
file = URI.open("https://images.pexels.com/photos/20806506/pexels-photo-20806506/free-photo-of-schwarz-und-weiss-schwarzweiss-frau-model.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
event_8.photo.attach(io: file, filename: "cinemujeres.jpg", content_type: "image/jpg")
event_8.save!






# # Nombres y descripciones de eventos orientados a mujeres
# event_names = [
#   "Conferencia: Mujeres que Cambian el Mundo",
#   "Taller de Networking para Mujeres Profesionales",
#   "Panel de Debate: Avances y Retos del Feminismo",
#   "Feria de Emprendedoras",
#   "Encuentro de Arte y Cultura Femenina",
#   "Charla Motivacional: Mujeres Inspiradoras",
#   "Curso Intensivo: Liderazgo y Empoderamiento",
#   "Festival de Cine Dirigido por Mujeres"
# ]

# # Crear 21 eventos orientados a mujeres
# events = []
# 21.times do |i|
#   owner = course_and_event_users.sample
#   events << Event.create!(
#     name: event_names.sample,
#     description: "Descripción del evento #{event_names.sample}",
#     status: ['draft', 'published'].sample,
#     event_date: Date.today + rand(30),
#     price: rand(10..100),
#     user: owner
#   )
# end

# # Obtener los cursos y eventos para las compras
# all_courses = Course.all

# # Crear 12 compras, asegurándose de que los primeros 4 usuarios estén en compras aleatorias
# 12.times do |i|
#   buyer = purchase_users.sample
#   course = all_courses.sample
#   Purchase.create!(
#     user: buyer,
#     course: course,
#     amount: course.price * rand(0.5..1.5)  # Monto aleatorio entre el 50% y el 150% del precio del curso
#   )
# end

# puts 'Seeds executed successfully!'
