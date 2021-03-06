# == Schema Information
# Schema version: 20091107191009
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)     not null
#  login               :string(255)     not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  creator_id          :integer(4)
#  updater_id          :integer(4)
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = "login"
  end

 
end
