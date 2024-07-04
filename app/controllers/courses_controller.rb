class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @courses = Course.search_courses(params[:query])
    else
      @courses = Course.all
    end
  end

  def show
    @curriculum_lines = @course.curriculum.split("\n")
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    if @course.save
      redirect_to @course, notice: "¡Curso creado exitosamente!"
    else
      render :new, status: :unprocessable_entity  #create, update y destroy llevan un status
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: "¡Curso actualizado exitosamente!"
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
    params.require(:course).permit(:name, :description, :price, :category, :curriculum, :photo)
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
