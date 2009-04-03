class Application < ActiveRecord::Base
  
  belongs_to :account
  has_many :statements, :dependent => :delete_all, :order => 'statements.logged_at DESC, statements.created_at DESC, id DESC'
  
  validates_presence_of :name, :token
  validates_uniqueness_of :token
  validates_uniqueness_of :name, :scope => "account_id"
  
  before_validation :generate_token
  
  named_scope :for, lambda { |user| {:conditions => { :account_id => user.account_id }} }
  
  def to_s; name; end
  
  private
  
  def generate_token
    self.token = ActiveSupport::SecureRandom.hex(16) if token.nil?
  end
end