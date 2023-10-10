require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:fatbody_article)
    @new_article = Article.new(title: 'Title', subtitle: 'Subtitle', content: 'Content')
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

  test 'should create a new article' do
    assert_difference('Article.count', 1, 'An article should be created') do
      post articles_url, params: {
        article: {
          title: @new_article.title,
          subtitle: @new_article.subtitle,
          content: @new_article.content
        }
      }
    end

    follow_redirect!
    # assert_redirected_to article_path(Article.last), status: :ok

    assert_select 'h1', @new_article.title.titleize
    assert_select 'p.text-xl', @new_article.subtitle
    assert_select 'p', @new_article.content
  end
end
