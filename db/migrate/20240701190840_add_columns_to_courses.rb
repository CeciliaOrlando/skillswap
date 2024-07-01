class AddColumnsToCourses < ActiveRecord::Migration[7.1]
  def change
    add_column :courses, :lecture, :integer
    add_column :courses, :quiz, :integer
    add_column :courses, :number_of_student, :integer
    add_column :courses, :duration, :string
    add_column :courses, :language, :string
    add_column :courses, :skill, :string
    add_column :courses, :curriculum, :text
    add_column :courses, :assessment, :text
  end
end
