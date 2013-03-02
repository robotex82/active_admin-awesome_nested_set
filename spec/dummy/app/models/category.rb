class Category < ActiveRecord::Base
  # attributes
  attr_accessible :name,
                  :parent_id

  # tree support
  acts_as_nested_set
  default_scope :order => 'lft ASC'

  # validations
  validates :name, :presence => true
end

