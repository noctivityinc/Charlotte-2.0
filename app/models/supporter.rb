class Supporter < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "250x250>" }
  validates_attachment_content_type :logo, 
      :content_type => ["image/jpeg", "image/png", "image/gif", "image/jpg"], 
      :message => "Oops! Make sure you are uploading an image file."

  validates_presence_of :name, :email
  validates_uniqueness_of :company, :message => "Your company is already registered as supporting Charlotte 2.0.  Thank you."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  named_scope :with_logos, :conditions => 'logo_file_name IS NOT NULL'
  named_scope :without_logos, :conditions => 'logo_file_name IS NULL'

  before_create :check_website

  def check_website
    self.website = "http://" + self.website unless self.website =~ /^(http|https)/
  end
end
