class Application < ActiveRecord::Base
  
  belongs_to :account
  has_many :statements, :dependent => :delete_all
  
  validates_presence_of :name, :token
  validates_uniqueness_of :token
  validates_uniqueness_of :name, :scope => "account_id"
  
  before_validation :generate_token
  
  private
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(16) if token.nil?
  end
end