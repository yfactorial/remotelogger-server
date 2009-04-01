Factory.define :user do |u|
  u.sequence(:email) { |n| "user#{n}@yfactorial.com"}
  u.sequence(:token) { |n| "token#{n}" }
  u.salt 'salt'
  u.crypted_password  { |a| User.digest(a.password, a.salt) }
  u.account { |a| a.association(:account) }
end
