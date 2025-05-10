require "application_system_test_case"

class ImportsTest < ApplicationSystemTestCase
  setup do
    @account = accounts(:checking)
    @import = imports(:checking)
  end

  test "visiting the index" do
    visit account_imports_url(@account)
    assert_selector "h1", text: @account.name
    assert_text @import.file.filename
  end

  test "should create import" do
    visit account_imports_url(@account)

    attach_file("import_file", Rails.root.join("test/fixtures/files/transactions.csv"))
    click_on "Upload file"

    assert_text "Import was successfully created"
    click_on @account.name
  end

  test "should destroy Import" do
    visit import_url(@import)
    accept_confirm do
      click_on "Destroy this import", match: :first
    end

    assert_text "Import was successfully destroyed"
  end
end
