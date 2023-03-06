class ResultsMailer < ApplicationMailer
  def results_published(student)
    @student = student
     # @course = Course.find_by(id: student.course_id)
    mail(to: @student.email, subject: "Results Published")
  end

  private

  def admin_emails
    User.where(role: :admin).pluck(:email)
  end
end
