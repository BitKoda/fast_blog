require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:fatbody_article)
  end

  test 'should get index page' do
    get articles_path
    assert_response :success
    assert_select 'article', minimum: 1
    assert_select 'h2', 'The Fast 800 Blogger'
    assert_select 'h3 a', @article.title.titleize
  end

  test 'should get show page' do
    get article_path(@article)
    assert_response :success
    assert_select 'h1', @article.title.titleize
    assert_select 'p.text-xl', @article.subtitle
    assert_select 'p', @article.content
  end
end
