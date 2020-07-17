require 'test_helper'

class ClassSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_schedule = class_schedules(:one)
  end

  test "should get index" do
    get class_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_class_schedule_url
    assert_response :success
  end

  test "should create class_schedule" do
    assert_difference('ClassSchedule.count') do
      post class_schedules_url, params: { class_schedule: { cost_per_month: @class_schedule.cost_per_month, day_of_week: @class_schedule.day_of_week, end_time: @class_schedule.end_time, start_time: @class_schedule.start_time } }
    end

    assert_redirected_to class_schedule_url(ClassSchedule.last)
  end

  test "should show class_schedule" do
    get class_schedule_url(@class_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_schedule_url(@class_schedule)
    assert_response :success
  end

  test "should update class_schedule" do
    patch class_schedule_url(@class_schedule), params: { class_schedule: { cost_per_month: @class_schedule.cost_per_month, day_of_week: @class_schedule.day_of_week, end_time: @class_schedule.end_time, start_time: @class_schedule.start_time } }
    assert_redirected_to class_schedule_url(@class_schedule)
  end

  test "should destroy class_schedule" do
    assert_difference('ClassSchedule.count', -1) do
      delete class_schedule_url(@class_schedule)
    end

    assert_redirected_to class_schedules_url
  end
end
