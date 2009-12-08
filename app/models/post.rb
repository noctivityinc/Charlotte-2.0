class Post < ActiveRecord::Base
  acts_as_taggable_on :tags
  has_friendly_id :title
  
  validates_presence_of :title, :body, :permalink
  validates_uniqueness_of :title
  validates_format_of :permalink, :with => /^[\w]+$/, :message => "is invalid"
  
  default_scope :order => 'posted_at desc'
  named_scope :active,  :conditions => "posted_at <= NOW()"
  
  
end
