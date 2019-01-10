class StudentCoursesController < ApplicationController
  
  def create
    add_course = Course.find(params[:course_id])
    unless current_user.courses.include?(add_course)
    StudentCourse.create(course: add_course, student: current_user)
    flash[:notice] = "You hvae successfully enrolled in #{add_course.name}"
    redirect_to current_user
    else
      flash[:notice] = "Please try enrollment again"
      redirect_to root_path
    end
  end
end