require_relative './v1/base'

module API
  class Base < Grape::API
    log_path =File.expand_path('../logfile.log', __FILE__)
    log_file = File.open(log_path, 'a')
    log_file.sync = true
    logger Logger.new GrapeLogging::MultiIO.new(STDOUT, log_file)

    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, { logger: logger }

    mount V1::Base
  end
end
