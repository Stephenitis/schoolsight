class School < ActiveRecord::Base
  attr_accessible :name, :phone, :principal_email, :principal_name
end
