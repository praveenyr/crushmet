require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { User.create!(first_name: "Prav", last_name: "Yall", email: "praveenyr@gmail.com", password: "helloworld", confirmed_at: '2017-07-01') }
  let(:registered_app) { RegisteredApplication.create!(name: "Cogniden", url: "http://localhost:3000", user: user) }

  it { is_expected.to have_many(:events) }

   describe "attributes" do
     it "has name and URL attributes" do
       expect(registered_app).to have_attributes(name: "Cogniden", url: "http://localhost:3000")
     end
   end
end
