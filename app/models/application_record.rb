class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :creation, -> {order(created_at: "DESC")}
end
