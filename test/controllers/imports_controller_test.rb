require "test_helper"

class ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:checking)
    @import = imports(:checking)
  end

  test "should get index" do
    get account_imports_url(@account)
    assert_response :success
  end

  test "should create import" do
    assert_difference("Import.count") do
      post account_imports_url(@account), params: { import: { file: file_fixture_upload("transactions.csv", "text/csv") } }
    end

    assert_redirected_to import_url(Import.last)
    assert Import.last.file.attached?
  end

  test "should show import" do
    get import_url(@import)
    assert_response :success
  end

  test "should destroy import" do
    assert_difference("Import.count", -1) do
      delete import_url(@import)
    end

    assert_redirected_to account_url(@account)
  end
end
