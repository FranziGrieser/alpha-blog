require "test_helper"

class ListArticlesTest < ActionDispatch::IntegrationTest
  def setup
    @article = Article.create(
      title: "My life",
      description: "It is just wonderful.",
    )
    @article2 = Article.create(
      title: "My wife",
      description: "She is just wonderful.",
    )
  end

  test "should show articles listing" do
    get articles_path
    assert_template "articles/index"
    assert_select "a[href=?]",
    articles_path,
      params: { id: @article.id }, title: @article.title
    assert_select "a[href=?]", articles_path,
      params: { id: @article2.id }, title: @article2.title
  end
end
