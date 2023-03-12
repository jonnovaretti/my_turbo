require 'test_helper'

class MyTurbo::TurboFrameHelperTest < ActionView::TestCase
  test 'my turbo frame tag returns with id from the model' do
    model = Article.new(id: 1)
    assert_dom_equal '<turbo-frame id="article_1"></turbo-frame>', my_turbo_frame_tag(model)
  end

  test 'my turbo frame tag returns with id from a string' do
    assert_dom_equal '<turbo-frame id="test_id"></turbo-frame>', my_turbo_frame_tag('test_id')
  end

  test 'my turbo frame tag returns with id from another element inside' do
    model = Article.new(id: 1)
    assert_dom_equal '<turbo-frame id="article_1"><p>hey</p></turbo-frame>', my_turbo_frame_tag(model) { tag.p('hey') }
  end
end
