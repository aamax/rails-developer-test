require 'rolify'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
