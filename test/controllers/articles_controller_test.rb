require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @article = Article.create(
      title: "My life",
      description: "It is just wonderful.",
    )
    @user = User.create(
      username: "john",
      email: "john@test.com",
      password: "password",
      admin: false,
    )
  end

  test "#get categories index" do
    get articles_path
    assert_response :success
  end

  test "#get new" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_response :success
  end

  test "#get show" do
    get articles_url, params: { id: @article.id }
    assert_response :success
  end

  test "should redirect when user is not logged in" do
    assert_no_difference "Article.count" do
      get new_article_path, params: {
        article: { title: "Article", description: "This is the desc" },
      }
    end
    assert_redirected_to root_path
  end
end
