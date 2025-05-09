require "test_helper"

class AccountTest < ActiveSupport::TestCase
  setup do
    @account = accounts(:checking)
  end

  test "is valid" do
    assert @account.valid?
  end

  test "is not valid without a name" do
    @account.name = nil

    assert_not @account.valid?
    assert_not_empty @account.errors[:name]
  end
end
