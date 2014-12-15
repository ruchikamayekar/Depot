require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:ruby).id
    end
    # assert_redirected_to cart_path(assigns(:line_item).cart)
    assert_redirected_to root_path
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post, :create, product_id: products(:ruby).id
    end
    assert_response :success
    assert_select_rjs :replace_html, 'cart' do
      assert_select 'tr#current_item td', /Programming Ruby 1.9/
    end
  end
end
