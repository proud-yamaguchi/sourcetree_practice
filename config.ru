require 'grape'
require 'grape_logging'
require_relative 'api/base'
require_relative 'api/client'

run API::Base
