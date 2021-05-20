require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:user)
  end

  def new_user(attributes = {})
    User.new(attributes)
  end

  test "should create user with valid attributes" do
    assert @user.valid?
  end

  test "should not create user with empty email" do
    user = new_user(email: '', password: 'password', password_confirmation: 'password')
    assert_not user.save
  end
  test "should not create user with invalid email" do
    %w(abc.def@mail..com abc.def A@b@c@mail.com "(),:;<>[\]l@mail.com a.b@ma_il.com).each do |email|
      user = new_user(email: email, password: 'password', password_confirmation: 'password')
      assert_not user.save
    end
  end

  test "should not create user with empy password" do
    user = new_user(email: 'empty_pass@mail.com', password: '', password_confirmation: '')
    user.save
    assert_equal "can't be blank", user.errors[:password].first
  end

  test "should not create user with less than 6 characters password" do
    user = new_user(email: 'empty_pass@mail.com', password: '12345', password_confirmation: '12345')
    user.save
    assert_equal "is too short (minimum is 6 characters)", user.errors[:password].first
  end

  test "shoud create user with default user role" do
    assert @user.user_role
  end

  test "should not create user with default superadmin role" do
    assert_not @user.superadmin_role
  end

  test "should not create user with default supervisor role" do
    assert_not @user.supervisor_role
  end

  test "should not confirm user with unconfirmed email" do
    assert_not @user.confirmed?
  end

  test "should confirm user with confirmed email" do
    @user.confirm
    assert @user.confirmed?
  end

  test "should have user name" do
    assert_equal 'user', @user.user_name
  end
end
