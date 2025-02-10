# class AgeCheckMiddleware
#     def initialize(app)
#       @app = app
#     end

#     def call(env)
#         #get user age
#         user_age = env["HTTP_USER_AGE"].to_i #header(Assming)

#         if user_age < 18
#             Rails.logger.info "Sorry #{user}, you are too young to access this page."
#         end

#         @app.call(env)
#     end
# end
