require 'active_admin'

require 'active_admin/awesome_nested_set/engine'
require 'active_admin/awesome_nested_set/version'
require 'active_admin/awesome_nested_set/helper'
require 'active_admin/views/index_as_nested_set'

module ActiveAdminActsAsAwesomeNestedSet
end

ActiveAdmin::ResourceDSL.send :include, ActiveAdmin::AwesomeNestedSet::Helper
ActiveAdmin::Views::IndexAsTable.send :include, ActiveAdmin::AwesomeNestedSet::Helper
