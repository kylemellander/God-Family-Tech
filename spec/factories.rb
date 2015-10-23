FactoryGirl.define do
  factory(:user) do
    email("email@example.com")
    password("12345678")
    password_confirmation("12345678")
    admin(true)
  end

  factory(:non_admin) do
    email("email1@example.com")
    password("12345678")
    password_confirmation("12345678")
  end
end
