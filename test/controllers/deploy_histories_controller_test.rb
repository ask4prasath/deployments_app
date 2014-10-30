require 'test_helper'

class DeployHistoriesControllerTest < ActionController::TestCase
  setup do
    @deploy_history = deploy_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deploy_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deploy_history" do
    assert_difference('DeployHistory.count') do
      post :create, deploy_history: { ended_at: @deploy_history.ended_at, history: @deploy_history.history, name: @deploy_history.name, started_at: @deploy_history.started_at, status: @deploy_history.status, user: @deploy_history.user }
    end

    assert_redirected_to deploy_history_path(assigns(:deploy_history))
  end

  test "should show deploy_history" do
    get :show, id: @deploy_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deploy_history
    assert_response :success
  end

  test "should update deploy_history" do
    patch :update, id: @deploy_history, deploy_history: { ended_at: @deploy_history.ended_at, history: @deploy_history.history, name: @deploy_history.name, started_at: @deploy_history.started_at, status: @deploy_history.status, user: @deploy_history.user }
    assert_redirected_to deploy_history_path(assigns(:deploy_history))
  end

  test "should destroy deploy_history" do
    assert_difference('DeployHistory.count', -1) do
      delete :destroy, id: @deploy_history
    end

    assert_redirected_to deploy_histories_path
  end
end
