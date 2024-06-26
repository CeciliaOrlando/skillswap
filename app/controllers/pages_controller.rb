class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @courses = Course.all
  end

  def my_courses
    @courses_as_teacher = current_user.courses
    @courses_as_student = current_user.courses_as_student
  end
end
