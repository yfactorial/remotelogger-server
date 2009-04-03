Factory.define :statement do |u|
  u.level 'INFO'
  u.sequence(:message) { |n| "Message number #{n} of many"}
  u.sequence(:device_id) { |n| "device#{n}" }
  u.logged_at Time.now
  u.application { |a| a.association(:application) }
end
