require "application_system_test_case"

class WeeklyPlansTest < ApplicationSystemTestCase
  setup do
    @weekly_plan = weekly_plans(:one)
  end

  test "visiting the index" do
    visit weekly_plans_url
    assert_selector "h1", text: "Weekly plans"
  end

  test "should create weekly plan" do
    visit weekly_plans_url
    click_on "New weekly plan"

    fill_in "Weekstart", with: @weekly_plan.weekstart
    click_on "Create Weekly plan"

    assert_text "Weekly plan was successfully created"
    click_on "Back"
  end

  test "should update Weekly plan" do
    visit weekly_plan_url(@weekly_plan)
    click_on "Edit this weekly plan", match: :first

    fill_in "Weekstart", with: @weekly_plan.weekstart
    click_on "Update Weekly plan"

    assert_text "Weekly plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Weekly plan" do
    visit weekly_plan_url(@weekly_plan)
    click_on "Destroy this weekly plan", match: :first

    assert_text "Weekly plan was successfully destroyed"
  end
end
