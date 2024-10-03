require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  class LoggedInUser < CommentsControllerTest
    setup do
      @comment = comments(:one)
      @post = posts(:one)
      @user = users(:one)
      login_as @user, scope: :user
    end

    test "should not get index" do
      get comments_url
      assert_response 404
    end

    test "should get new" do
      get new_comment_url(user_id: @user.id, post_id: @post.id)
      assert_response :success
    end

    test "should create comment" do
      assert_difference("Comment.count") do
        post comments_url, params: {
          comment: {
            post_id: @post.id,
            user_id: @user.id,
            body: "Body text"
          }
        }
      end

      assert_redirected_to post_url(@post)
    end

    test "should not show comment" do
      get comment_url(@comment)
      assert_response 404
    end

    test "should not get edit" do
      assert_raises NoMethodError do
        get edit_comment_url(@comment)
      end
    end

    test "should update comment" do
      patch comment_url(@comment), params: {
        comment: {
          post_id: @comment.post_id
        }
      }
      assert_redirected_to post_url(@comment.post_id)
    end

    test "should destroy comment" do
      assert_difference("Comment.count", -1) do
        delete comment_url(@comment)
      end

      assert_redirected_to comments_url
    end
  end
end
