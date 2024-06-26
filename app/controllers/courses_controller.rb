class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to courses_path, notice: "Course created successfully!"
    else
      render :new, status: :unprocessable_entity  #create, update y destroy llevan un status
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, status: :see_other
  end

  private
  def course_params
    params.require(:course).permit(:name, :description, :price)
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
