require "application_system_test_case"

class FixesTest < ApplicationSystemTestCase
  setup do
    @fix = fixes(:one)
  end

  test "visiting the index" do
    visit fixes_url
    assert_selector "h1", text: "Fixes"
  end

  test "should create fix" do
    visit fixes_url
    click_on "New fix"

    fill_in "Description", with: @fix.description
    fill_in "Name", with: @fix.name
    fill_in "Project", with: @fix.project_id
    click_on "Create Fix"

    assert_text "Fix was successfully created"
    click_on "Back"
  end

  test "should update Fix" do
    visit fix_url(@fix)
    click_on "Edit this fix", match: :first

    fill_in "Description", with: @fix.description
    fill_in "Name", with: @fix.name
    fill_in "Project", with: @fix.project_id
    click_on "Update Fix"

    assert_text "Fix was successfully updated"
    click_on "Back"
  end

  test "should destroy Fix" do
    visit fix_url(@fix)
    click_on "Destroy this fix", match: :first

    assert_text "Fix was successfully destroyed"
  end
end
