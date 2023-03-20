require 'test_helper'

class MyTurbo::ArticlesTest < ActionDispatch::IntegrationTest
  test 'should create article' do
    get new_article_url
    assert_response :success

    assert_difference('Article.count') do
      post articles_url, params: { article: { context: 'MyText' } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test 'should create article with turbo stream' do
    get new_article_url
    assert_response :success

    assert_difference('Article.count') do
      post articles_url, params: { article: { context: 'MyText' } }, as: :turbo_stream
    end

    assert_turbo_stream(action: 'prepend', target: 'articles')
  end

  test 'should update article' do
    article = Article.create!(context: 'MyText')
    get edit_article_url(article)
    assert_response :success

    patch article_url(article), params: { article: { context: 'MyText' } }
    assert_redirected_to article_url(article)
  end

  test 'should update article with turbo stream' do
    article = Article.create!(context: 'MyText')
    get edit_article_url(article)
    assert_response :success

    patch article_url(article), params: { article: { context: 'MyText' } }, as: :turbo_stream
    assert_turbo_stream(action: 'replace', target: dom_id(article))
  end

  test 'should destroy article' do
    article = Article.create!(context: 'MyText')
    assert_difference('Article.count', -1) do
      delete article_url(article)
    end

    assert_redirected_to articles_url
  end

  test 'should destroy article with turbo stream' do
    article = Article.create!(context: 'MyText')
    assert_difference('Article.count', -1) do
      delete article_url(article), as: :turbo_stream
    end

    assert_turbo_stream(action: 'remove', target: dom_id(article))
  end
end
