require 'hogan_assets'

HoganAssets::Config.configure do |config|
  config.haml_options[:ugly] = true
  config.hamstache_extensions = %w(hamstache hamlhbs)
  config.path_prefix = 'templates'
end
