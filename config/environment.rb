# ActiveSupport::Deprecation.behavior = Proc.new { |msg, stack| MyLogger.warn(msg) }
# Load the Rails application.
require_relative 'application'

::ActiveSupport::Deprecation.silenced = true
# Initialize the Rails application.
Rails.application.initialize!
::ActiveSupport::Deprecation.silenced = true
ActiveSupport::Deprecation.behavior = proc { |msg, _stack| MyLogger.warn(msg) }
