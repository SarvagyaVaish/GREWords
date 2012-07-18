require 'test_helper'

class WhatsNewMessagesControllerTest < ActionController::TestCase
  setup do
    @whats_new_message = whats_new_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:whats_new_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create whats_new_message" do
    assert_difference('WhatsNewMessage.count') do
      post :create, whats_new_message: { message: @whats_new_message.message, status: @whats_new_message.status }
    end

    assert_redirected_to whats_new_message_path(assigns(:whats_new_message))
  end

  test "should show whats_new_message" do
    get :show, id: @whats_new_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @whats_new_message
    assert_response :success
  end

  test "should update whats_new_message" do
    put :update, id: @whats_new_message, whats_new_message: { message: @whats_new_message.message, status: @whats_new_message.status }
    assert_redirected_to whats_new_message_path(assigns(:whats_new_message))
  end

  test "should destroy whats_new_message" do
    assert_difference('WhatsNewMessage.count', -1) do
      delete :destroy, id: @whats_new_message
    end

    assert_redirected_to whats_new_messages_path
  end
end
