class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :course, optional: true
  belongs_to :event, optional: true

end


#1)belongs_to :event + optional for not forcing sells from both events and courses(flexibility for users)
#2)event_id column in purchases (rails g migration AddEventToPurchases event:references)
#3)rails db:migrate
#4)validations for ordering the events purchases in their column, not mixing courses and events purchases

#5)add column 'category' to courses table(rails g migration AddCategoryToCourses category)
#6) rails db:migrate
#7) add category to courses in seeds.rb
#8) front-end for purchases new.html.erb
