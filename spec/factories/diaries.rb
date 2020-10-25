FactoryBot.define do
  factory :diary do
    title           { "今日の出来事" }
    content         { "今日はこんなことがあった" }
    open            { "1" }
    start_time      { "2020-10-13" }

    association :user

    after(:build) do |diary|
      diary.images.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
     end
  end
end
