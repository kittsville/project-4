class Order < ActiveRecord::Base
  has_one :delivery
end
