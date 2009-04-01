module ApplicationHelper

  # Print out all flash messages in a span of the same
  # class as the message type
  def flash_messages
    html = flash.collect do |type, message|
      content_tag(:div, message, :class => type)
    end
    flash.clear # Not sure why we have to manually do this sometimes
    html
  end
  
  # Are there any flash messages to display?
  def flash_messages?; flash.any?; end
  
  # Set the page title
  def page_title(title)
    content_for :page_title, title
  end
  
  # Set the html header title
  def head_title(title)
    content_for :head_title, title
  end
  
  # Get the authenticity token (useful for an ajax call)
  def auth_token
    (protect_against_forgery? ? form_authenticity_token : nil)
  end
end
