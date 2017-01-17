module API
  module V1
    class HelloApi < Grape::API
      resource :hello do
        desc "hello grape api"
        get do
          response = {message: "hello grape"}
          #response = Service.first
          body response
        end
      end
    end
  end
end
