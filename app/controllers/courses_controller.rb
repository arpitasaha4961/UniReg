class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: %i[ show edit update destroy enroll]

  # GET /courses or /courses.json
  def index
    if params[:semester].present?
      @courses = Course.where(semester: params[:semester])
    else
      @courses = Course.all
    end
  end

  # GET /courses/1 or /courses/1.json
  def show
    @course = Course.find(params[:id])
    authorize! :read, @course
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def enroll
    puts "i am in enroll"
    @course = Course.find(params[:id])
    @semester = Semester.find(params[:semester_id])
    @enrollment = Enrollment.new(user: current_user, course: @course, semester: @semester)
    puts "DEBUG: @enrollment = #{@enrollment}"
    if @enrollment.save
      redirect_to @course, notice: "Enrolled successfully."
    else
      redirect_to @course, alert: "Enrollment failed."
    end

    # @course = Course.find(params[:id])
    # @semester = Semester.find(params[:semester_id])
    # @user = current_user
    #
    # puts @user
    # # puts @course
    # # puts @semester
    #
    # if current_user.enrollments.exists?(course: @course, semester: @semester)
    #   redirect_to @course, alert: 'You have already enrolled in this course for the selected semester'
    # else
    #   enrollment = Enrollment.new(course: @course, user: current_user, semester: @semester)
    #   if enrollment.save
    #     redirect_to @course, notice: "You have successfully enrolled in this course for the selected semester"
    #   else
    #     redirect_to @course, alert: "Failed to enroll in this course for the selected semester"
    #   end
    # end
    # @course = Course.find(params[:id])
    # current_user.courses << @course
    # redirect_to root_path
    # @course.enrollments.create(user_id: current_user.id)
    # redirect_to @course, notice: 'You have successfully enrolled in this course!'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    # params.require(:course).permit(:title, :course_code, :credit, :semester)
    params.fetch(:course, {}).permit(:title, :course_code, :credit, :semester)
  end



end
