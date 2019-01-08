class StudentsController < ApplicationController
  #skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_same_student, only: [:edit, :update]
  
  def index
    @students = Student.all
  end
  
  def show
    
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Thank you for enrolling!"
      redirect_to @student
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
    
  end
  
  def destroy
    
  end
  
  private
  
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
  
  
  def set_student
    @student = Student.find(params[:id])
  end
  
  def require_same_student
    if current_user != @student
      redirect_to student_path(current_user)
      flash[:notice] = "Profile Restricted"
    end
  end
  
end