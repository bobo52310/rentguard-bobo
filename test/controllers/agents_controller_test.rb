require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agent" do
    assert_difference('Agent.count') do
      post :create, agent: { contact_id: @agent.contact_id, title: @agent.title }
    end

    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should show agent" do
    get :show, id: @agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agent
    assert_response :success
  end

  test "should update agent" do
    patch :update, id: @agent, agent: { contact_id: @agent.contact_id, title: @agent.title }
    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should destroy agent" do
    assert_difference('Agent.count', -1) do
      delete :destroy, id: @agent
    end

    assert_redirected_to agents_path
  end
end
