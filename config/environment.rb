# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
config.exceptions_app = self.routes
