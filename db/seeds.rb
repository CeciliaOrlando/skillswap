# seeds.rb

# Limpiar la base de datos antes de ejecutar los seeds en desarrollo
if Rails.env.development?
  puts 'Cleaning database...'
  Purchase.destroy_all  # Eliminar todas las compras primero
  Course.destroy_all    # Luego eliminar todos los cursos
  Event.destroy_all     # También eliminar todos los eventos
  User.destroy_all      # Finalmente eliminar todos los usuarios
end

# Crear 8 usuarios
users_data = [
  { email: 'cecilia@gmail.com', first_name: 'Cecilia', last_name: 'González' },
  { email: 'laura@gmail.com', first_name: 'Laura', last_name: 'Martínez' },
  { email: 'ana@gmail.com', first_name: 'Ana', last_name: 'López' },
  { email: 'maria@gmail.com', first_name: 'María', last_name: 'Fernández' },
  { email: 'clara@gmail.com', first_name: 'Clara', last_name: 'García' },
  { email: 'paula@gmail.com', first_name: 'Paula', last_name: 'Pérez' },
  { email: 'sofia@gmail.com', first_name: 'Sofía', last_name: 'Díaz' },
  { email: 'isabel@gmail.com', first_name: 'Isabel', last_name: 'Rodríguez' }
]

users = []
users_data.each do |user_data|
  users << User.create!(
    email: user_data[:email],
    password: 'password',
    first_name: user_data[:first_name],
    last_name: user_data[:last_name]
  )
end

# Obtener los primeros 4 usuarios para compras aleatorias
purchase_users = users[0..3]

# Obtener los usuarios restantes para cursos y eventos
course_and_event_users = users[4..7]

# Nombres y descripciones de cursos orientados a mujeres
course_names = [
  "Empoderamiento Financiero para Mujeres",
  "Liderazgo Femenino en la Tecnología",
  "Desarrollo Personal: El Poder de Ser Mujer",
  "Marketing Digital para Emprendedoras",
  "Arte y Creatividad: Expresión Femenina",
  "Salud y Bienestar: Cuidado Personal Integral",
  "Negociación y Comunicación Efectiva para Mujeres",
  "Emprendimiento Social: Impacto y Sostenibilidad"
]

# Crear 21 cursos orientados a mujeres
courses = []
21.times do |i|
  owner = course_and_event_users.sample
  courses << Course.create!(
    name: course_names.sample,
    description: "Descripción del curso sobre #{course_names.sample}",
    price: rand(50..200),
    user: owner
  )
end

# Nombres y descripciones de eventos orientados a mujeres
event_names = [
  "Conferencia: Mujeres que Cambian el Mundo",
  "Taller de Networking para Mujeres Profesionales",
  "Panel de Debate: Avances y Retos del Feminismo",
  "Feria de Emprendedoras",
  "Encuentro de Arte y Cultura Femenina",
  "Charla Motivacional: Mujeres Inspiradoras",
  "Curso Intensivo: Liderazgo y Empoderamiento",
  "Festival de Cine Dirigido por Mujeres"
]

# Crear 21 eventos orientados a mujeres
events = []
21.times do |i|
  owner = course_and_event_users.sample
  events << Event.create!(
    name: event_names.sample,
    description: "Descripción del evento #{event_names.sample}",
    status: ['draft', 'published'].sample,
    event_date: Date.today + rand(30),
    price: rand(10..100),
    user: owner
  )
end

# Obtener los cursos y eventos para las compras
all_courses = Course.all

# Crear 12 compras, asegurándose de que los primeros 4 usuarios estén en compras aleatorias
12.times do |i|
  buyer = purchase_users.sample
  course = all_courses.sample
  Purchase.create!(
    user: buyer,
    course: course,
    amount: course.price * rand(0.5..1.5)  # Monto aleatorio entre el 50% y el 150% del precio del curso
  )
end

puts 'Seeds executed successfully!'
