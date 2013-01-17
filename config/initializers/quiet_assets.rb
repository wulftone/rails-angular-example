# Disables all of the excessive asset loading logging, preventing clutter in
# your otherwise helpful output window.
Rails.application.assets.logger = Logger.new('/dev/null')
Rails::Rack::Logger.class_eval do
  def call_with_quiet_assets(env)
    previous_level = Rails.logger.level
    Rails.logger.level = Logger::ERROR if env['PATH_INFO'].index("/assets/") == 0
    call_without_quiet_assets(env).tap do
      Rails.logger.level = previous_level
    end
  end
  alias_method_chain :call, :quiet_assets
 end

# Rails::Rack::Logger.class_eval do
#   def before_dispatch_with_quiet_assets(env)
#     before_dispatch_without_quiet_assets(env) unless env['PATH_INFO'].index("/assets/") == 0
#   end
#   alias_method_chain :before_dispatch, :quiet_assets
# end
