# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :osystem do
    name "Linux"
    install_code "apt-get install"
  end
end
