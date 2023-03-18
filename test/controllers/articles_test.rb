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
      post articles_url, params: { article: { context: 'MyText' } }, headers: { 'Accept': 'text/vnd.turbo-stream.html' }
    end

    assert_response :success
    assert_equal Mime[:turbo_stream], @response.media_type

    selector = %(turbo-stream[action="prepend"])
    selector << %([target="articles"])

    assert_select selector, 1
  end
end
