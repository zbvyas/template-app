require 'test_helper'

# In Rails 5, controller tests have changed to IntegrationTest
class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    # create will save to the db (.new does not save to db)
    @category = Category.create(name: "sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    # in Rails 5, you have to specify the routes path + http method
    get categories_path
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{name:"sports"}}
    end
    assert_redirected_to categories_path
  end

end
