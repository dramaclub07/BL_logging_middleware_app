class RequestLogger
    def initialize(app) #sets our app to call the next piece of middleware in stack
      @app = app
    end

    # def user(name)
    #   @name = name
    # end

    def call(env) #custom middleware for routing response and requests
        #@ instance that is invoked at each request(logs for get/post and even the path /home)
      begin
        request = Rack::Request.new(env)
        start_time = Time.now

        Rails.logger.info  "📩 Incoming Request #{request.request_method} #{request.fullpath}" #

        status, headers, response = @app.call(env)  #processes the request and sends it to the next middleware or controller.

        #to calculate time taken by request till response

        end_time = Time.now

        duration =(end_time - start_time) * 1000.0

        Rails.logger.info "📊 Your Request took #{duration.round(2)} ms to complete" if status >= 200 && status
        Rails.logger.info "✅ Response Sent: Status: #{status} "

        [status, headers, response]
      rescue StandardError => e
        Rails.logger.error "🚨SOS Error Occurred: #{e.message}"
      end
    end
  end