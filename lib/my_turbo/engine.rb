require 'my_turbo/test_assertions'

module MyTurbo
  class Engine < ::Rails::Engine
    isolate_namespace MyTurbo

    initializer 'turbo.media_type' do
      Mime::Type.register 'text/vnd.turbo-stream.html', :turbo_stream
    end

    initializer 'turbo.helpers' do
      ActiveSupport.on_load(:action_controller_base) do
        helper MyTurbo::Engine.helpers
      end
    end

    initializer 'turbo.test_assertions' do
      ActiveSupport.on_load :active_support_test_case do
        include MyTurbo::TestAssertions
      end
    end

    initializer 'turbo.streams' do
      ActiveSupport.on_load(:action_dispatch_integration_test) do
        # Support `as: :turbo_stream`. Public `register_encoder` API is a little too strict.
        class ActionDispatch::RequestEncoder
          class TurboStreamEncoder < IdentityEncoder
            header = [Mime[:turbo_stream], Mime[:html]].join(',')
            define_method(:accept_header) { header }
          end

          @encoders[:turbo_stream] = TurboStreamEncoder.new
        end
      end
    end
  end
end
