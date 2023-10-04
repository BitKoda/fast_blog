require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    @article = Article.new(
      title: articles(:fatbody_article).title,
      subtitle: 'subtitle',
      content: 'article content'
    )
  end

  test 'an article is valid only with a unique title' do
    @article.title = "A unique title #{rand(1000)}"
    assert @article.save
  end

  test 'an article is invalid without a unique title' do
    assert @article.invalid?
    assert_equal ['has already been taken'], @article.errors[:title]
  end

  test 'an article is invalid without a title' do
    @article.title = ''
    assert @article.invalid?
    assert_equal ['Title cannot be blank'], @article.errors[:title]
  end

  test 'an article is invalid without content' do
    @article.content = ''
    assert @article.invalid?
    assert_equal ['Content cannot be blank'], @article.errors[:content]
  end
end
