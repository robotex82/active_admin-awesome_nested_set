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
        super page_presenter, get_nested_set( resource_class )
      end

      protected

      def get_nested_set class_or_item
        result = []

        roots = class_or_item.respond_to?(:scoped) ? class_or_item.roots : class_or_items

        items = roots.each do |root|
          result += root.self_and_descendants.compact
        end

        result
      end

    end
  end
end

