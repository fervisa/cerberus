module Cerberus
  class User < ApplicationRecord
    self.table_name = "users"
    has_secure_password
    validates :email, presence: true
  end
end
