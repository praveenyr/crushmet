FactoryGirl.define do
  factory :registered_application do
    name "My App"
    url "http://myapp.com"
    user
  end
end
