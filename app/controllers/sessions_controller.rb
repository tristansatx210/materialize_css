class SessionsController < ApplicationController
  #skip_before_action :require_user, only: [:new, :create]
  
  def new
    
  end
  
  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    if student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      redirect_to student
    else
      flash.now[:notice] = "Incorrect Email/Password"
      render 'new'
    end
  end
  
  def destroy
    session[:student_id] = nil
    redirect_to root_path
  end
  
end