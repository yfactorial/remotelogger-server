Factory.define :account do |u|
  u.sequence(:name) { |n| "Company #{n}"}
end
