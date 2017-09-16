class EventWorker
  include Sidekiq::Worker

  def perform(hash)
    registered_app = RegisteredApplication.find(hash["id"])
    event = Event.create(name: hash["name"], registered_application: registered_app)
    puts "<< Registered Event #{hash["name"]} for #{registered_app.name} >>"
  end
end
