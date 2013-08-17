require 'bundler'
Bundler.setup

lib_dir = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require 'initializer'
require 'extension'
require 'filtering'
require 'tasks'
require 'movies'
require 'comparisons'
