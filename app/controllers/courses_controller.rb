class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true)

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course, include: [
      :permanent_course, 
      :last_edit_user,
      :course_ratings
    ]
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # TODO: 實作評分邏輯
  def rating

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.fetch(:course, {})
          .permit(:assignment_record, :exam_record, :rollcall_frequency)
  end
end
