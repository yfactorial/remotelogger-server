Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@yfactorial.com"}
  u.sequence(:token) { |n| "token#{n}" }
  u.salt 'salt'
  u.password 'password'
  u.password_confirmation { |user| user.password }
  u.crypted_password  { |a| User.digest(a.password, a.salt) }
  u.time_zone 'Eastern Time (US & Canada)'
  u.account { |a| a.association(:account) }
end
