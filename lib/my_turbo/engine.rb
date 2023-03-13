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
  end
end
