require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "article must not be empty" do
    article = Article.new
    assert article.invalid?
    assert article.errors[:title].any?
    assert article.errors[:body].any?
  end

  test "article title length must not be be lesser than 10" do
    article = Article.new(body: "This is the body of my article. It should be slightly length than the title.")
    article.title = "a"
    assert article.invalid?
    assert_equal ["title must be greater than or equal to 10 characters in length"],
      article.errors[:article]
  end

  test "article title body must not be be lesser than 15" do
    article = Article.new(title: "This is the title of my article.")
    article.body = "article body"
    assert article.invalid?
    assert_equal ["body must be greater than or equal to 15 characters in length"],
      article.errors[:article]
  end

  test "article title amd body are valid" do
    article = Article.new(title: "This is the test title for a test article", body:"This is the test body for a test article.This is longer than the title.")
    assert article.valid?
  end
end
