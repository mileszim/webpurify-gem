$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'web_purify'

Dir['spec/support/**/*.rb'].each { |f| require_relative "../#{f}" }