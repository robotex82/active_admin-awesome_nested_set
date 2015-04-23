# -*- coding: utf-8 -*-
module ActiveAdmin
  module Views

    # = Index as a Nested Set
    #
    # Shows index page as a tree
    #
    #     index :as => :nested_set do |product|
    #      Another options for table
    #       link_to(image_tag(product.image_path), admin_products_path(product))
    #     end
    #
    class IndexAsNestedSet < IndexAsTable

      def build(page_presenter, collection)
p Rails.version      
        super page_presenter, get_nested_set(resource_class)
#        if Rails.version < '4.0.0'
#          super page_presenter, get_nested_set( resource_class )
#        else
#          super page_presenter, get_nested_set_rails_4( resource_class )
#        end
      end

      protected

#      def get_nested_set(class_or_item)
#        result = []

#        roots = class_or_item.respond_to?(:scoped) ? class_or_item.roots : class_or_item

#        items = roots.each do |root|
#          result += root.self_and_descendants.to_a.compact
#        end

#        result
#      end

      def get_nested_set(resource_class)
        resource_class.roots.map(&:self_and_descendants).flatten
      end

    end
  end
end

