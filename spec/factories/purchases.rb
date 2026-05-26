FactoryBot.define do
  factory :purchase do
    description { "MyString" }
    value { "9.99" }
    date { "2026-05-26" }
    bank { nil }
    panel { nil }
  end
end
