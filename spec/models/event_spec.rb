require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:user) { User.create!(first_name: "Prav", last_name: "Yall", email: "praveenyr@gmail.com", password: "helloworld", confirmed_at: '2017-07-01') }
  let(:registered_app) { RegisteredApplication.create!(name: "Cogniden", url: "http://localhost:3000", user: user) }
  let(:event){ registered_app.events.create!(name: "RandomEvent") }

  it { is_expected.to belong_to(:registered_application) }

  describe "attributes" do
    it "has a name attribute" do
      expect(event).to have_attributes(name: "RandomEvent")
    end
  end

end
