module MyTurbo::StreamsHelper
  def turbo_stream
    MyTurbo::Streams::TagBuilder.new(self)
  end
end
