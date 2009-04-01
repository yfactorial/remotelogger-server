ExceptionNotifier.exception_recipients = %w(ryan.daigle+remotelogger@gmail.com)
ExceptionNotifier.sender_address = %("RemoteLogger Error" <errors@remotelogger.com>)
ExceptionNotifier.email_prefix = ENV['RAILS_ENV'] ? "[#{ENV['RAILS_ENV'].upcase}]" : ''