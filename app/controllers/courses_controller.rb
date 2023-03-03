class CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :set_course, only: %i[ show edit update destroy ]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :course_code, :credit, :semester)
    end

  def enroll
    course = Course.find(params[:id])
    user = current_user # or however you get the current user
    enrollment = Enrollment.create(course: course, user: user)
    if enrollment.save
      flash[:success] = "You are now enrolled in #{course.name}!"
      redirect_to course
    else
      flash[:error] = "Failed to enroll in #{course.name}."
      redirect_to courses_path
    end
  end
end
