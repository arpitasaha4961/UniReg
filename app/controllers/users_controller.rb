class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy]
  before_action :authorize_admin!, only: [:publish_results]
  def publish_results
    @user = User.find(params[:user_id])
    # puts "I am in publish"
    # puts @user
    # Publish the results

    # Send email to students
    @students = User.where(role: 'student')
    # puts @students
    # puts "the students i get"
    @students.each do |student|
      puts "I am a student profile"
      puts student.id
      puts "i am in the loop"
    end
    redirect_to root_path, notice: "Results published and email sent to students."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def authorize_admin!
    redirect_to root_path, alert: "Access denied. You are not authorized to perform this action." unless current_user.admin?
  end

end
