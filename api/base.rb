require_relative './v1/base'

module API
  class Base < Grape::API
    log_file = File.open('/home/yamaguchi/Development/push_notification/grape_front/logfile.log', 'a')
    log_file.sync = true
    logger Logger.new GrapeLogging::MultiIO.new(STDOUT, log_file)

    ActiveRecord::Base.logger = logger

    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, { logger: logger }

    mount V1::Base
  end
end
