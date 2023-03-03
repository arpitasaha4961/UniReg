require "application_system_test_case"

class RailsTest < ApplicationSystemTestCase
  setup do
    @rail = rails(:one)
  end

  test "visiting the index" do
    visit rails_url
    assert_selector "h1", text: "Rails"
  end

  test "creating a Rail" do
    visit rails_url
    click_on "New Rail"

    fill_in "Studentprofile", with: @rail.StudentProfile
    fill_in "Address", with: @rail.address
    fill_in "Date of birth", with: @rail.date_of_birth
    fill_in "Email", with: @rail.email
    fill_in "Emergency contact name", with: @rail.emergency_contact_name
    fill_in "Emergency contact phone", with: @rail.emergency_contact_phone
    fill_in "First name", with: @rail.first_name
    fill_in "Generate", with: @rail.generate
    fill_in "Last name", with: @rail.last_name
    fill_in "Phone", with: @rail.phone
    fill_in "Scaffold", with: @rail.scaffold
    fill_in "User", with: @rail.user_id
    click_on "Create Rail"

    assert_text "Rail was successfully created"
    click_on "Back"
  end

  test "updating a Rail" do
    visit rails_url
    click_on "Edit", match: :first

    fill_in "Studentprofile", with: @rail.StudentProfile
    fill_in "Address", with: @rail.address
    fill_in "Date of birth", with: @rail.date_of_birth
    fill_in "Email", with: @rail.email
    fill_in "Emergency contact name", with: @rail.emergency_contact_name
    fill_in "Emergency contact phone", with: @rail.emergency_contact_phone
    fill_in "First name", with: @rail.first_name
    fill_in "Generate", with: @rail.generate
    fill_in "Last name", with: @rail.last_name
    fill_in "Phone", with: @rail.phone
    fill_in "Scaffold", with: @rail.scaffold
    fill_in "User", with: @rail.user_id
    click_on "Update Rail"

    assert_text "Rail was successfully updated"
    click_on "Back"
  end

  test "destroying a Rail" do
    visit rails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rail was successfully destroyed"
  end
end
