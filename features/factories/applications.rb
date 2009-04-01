Factory.define :application do |u|
  u.sequence(:name) { |n| "App #{n}"}
  u.account { |a| a.association(:account) }
end
