require 'test_helper'

class ArticlePartsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_part" do
    assert_difference('ArticlePart.count') do
      post :create, :article_part => { }
    end

    assert_redirected_to article_part_path(assigns(:article_part))
  end

  test "should show article_part" do
    get :show, :id => article_parts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => article_parts(:one).to_param
    assert_response :success
  end

  test "should update article_part" do
    put :update, :id => article_parts(:one).to_param, :article_part => { }
    assert_redirected_to article_part_path(assigns(:article_part))
  end

  test "should destroy article_part" do
    assert_difference('ArticlePart.count', -1) do
      delete :destroy, :id => article_parts(:one).to_param
    end

    assert_redirected_to article_parts_path
  end
end
