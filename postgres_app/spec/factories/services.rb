FactoryBot.define do
  factory :service do
    patron { nil }
    provider { "MyString" }
    uid { "MyString" }
    access_token { "MyString" }
    access_token_secret { "MyString" }
    refresh_token { "MyString" }
    expires_at { "2023-09-10 13:25:43" }
    auth { "MyText" }
  end
end
