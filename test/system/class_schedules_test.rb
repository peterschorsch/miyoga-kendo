require "application_system_test_case"

class ClassSchedulesTest < ApplicationSystemTestCase
  setup do
    @class_schedule = class_schedules(:one)
  end

  test "visiting the index" do
    visit class_schedules_url
    assert_selector "h1", text: "Class Schedules"
  end

  test "creating a Class schedule" do
    visit class_schedules_url
    click_on "New Class Schedule"

    fill_in "Cost per month", with: @class_schedule.cost_per_month
    fill_in "Day of week", with: @class_schedule.day_of_week
    fill_in "End time", with: @class_schedule.end_time
    fill_in "Start time", with: @class_schedule.start_time
    click_on "Create Class schedule"

    assert_text "Class schedule was successfully created"
    click_on "Back"
  end

  test "updating a Class schedule" do
    visit class_schedules_url
    click_on "Edit", match: :first

    fill_in "Cost per month", with: @class_schedule.cost_per_month
    fill_in "Day of week", with: @class_schedule.day_of_week
    fill_in "End time", with: @class_schedule.end_time
    fill_in "Start time", with: @class_schedule.start_time
    click_on "Update Class schedule"

    assert_text "Class schedule was successfully updated"
    click_on "Back"
  end

  test "destroying a Class schedule" do
    visit class_schedules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class schedule was successfully destroyed"
  end
end
