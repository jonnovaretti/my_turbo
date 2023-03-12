module MyTurbo
  class Engine < ::Rails::Engine
    isolate_namespace MyTurbo

    initializer 'my_turbo.helpers' do
      ActiveSupport.on_load(:action_controller_base) do
        helper MyTurbo::Engine.helpers
      end
    end
  end
end
