require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:user) { User.create!(first_name: "Prav", last_name: "Yall", email: "praveenyr@gmail.com", password: "helloworld", confirmed_at: '2017-07-01') }
  let(:registeredapp) { RegisteredApplication.create!(name: "Cogniden", url: "http://localhost:3000", user: user) }

 # #2
   describe "attributes" do
     it "has name and URL attributes" do
       expect(registeredapp).to have_attributes(name: "Cogniden", url: "http://localhost:3000")
     end
   end
end
