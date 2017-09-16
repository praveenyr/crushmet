class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :set_access_control_headers

   def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
   end

  def create
    begin
      registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
      raise "Registered App error" unless registered_application
      EventWorker.perform_async(name: event_params[:name], id: registered_application.id)
    rescue StandardError
      render json: "Unregistered application", status: :unprocessable_entity
      return
    end

    def preflight
      head 200
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

  # def unregistered_app
  # render json: "Unregistered application", status: :unprocessable_entity
  # end
end
