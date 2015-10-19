require 'test_helper'

class ScootsControllerTest < ActionController::TestCase
  setup do
    @scoot = scoots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scoots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scoot" do
    assert_difference('Scoot.count') do
      post :create, scoot: { body: @scoot.body, leave_from: @scoot.leave_from, leave_to: @scoot.leave_to, subject: @scoot.subject }
    end

    assert_redirected_to scoot_path(assigns(:scoot))
  end

  test "should show scoot" do
    get :show, id: @scoot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scoot
    assert_response :success
  end

  test "should update scoot" do
    patch :update, id: @scoot, scoot: { body: @scoot.body, leave_from: @scoot.leave_from, leave_to: @scoot.leave_to, subject: @scoot.subject }
    assert_redirected_to scoot_path(assigns(:scoot))
  end

  test "should destroy scoot" do
    assert_difference('Scoot.count', -1) do
      delete :destroy, id: @scoot
    end

    assert_redirected_to scoots_path
  end
end
