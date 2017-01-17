Dir[File.expand_path('./api/v1') << "/*.rb"].reject{|elm| elm =~ /base/}.each do |file|
  STDOUT.puts file
  require_relative file
end

module API
  module V1
    class Base < Grape::API
      format :json
      default_format :json

      version 'v1'

      mount V1::HelloApi
    end
  end
end
