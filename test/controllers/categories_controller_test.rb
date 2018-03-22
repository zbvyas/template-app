require 'test_helper'

# In Rails 5, controller tests have changed to IntegrationTest
class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    # create will save to the db (.new does not save to db)
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    # in Rails 5, you have to specify the routes path + http method
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

end
