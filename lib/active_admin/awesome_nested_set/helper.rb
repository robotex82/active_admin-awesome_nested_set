module ActiveAdmin
  module AwesomeNestedSet
    module Helper 
      # Call this inside your index do...end block to make a column indented
      # for improved readability.
      #
      # Requires 'depth' be included in the resource
      #
      # Example:
      #
      # #app/admin/players.rb
      #
      #  ActiveAdmin.register Player do
      #    index do
      #      #...
      #      # This indents the firstname column based upon the :depth property
      #      sortable_tree_indented_column :firstname
      #      column :lastname
      #      #...
      #    end
      #  end
      def sortable_tree_indented_column column_name
        column :name do |resource|
          if resource.respond_to?("depth")
            "<span style=\"padding-left:#{resource.depth*24}px\">&bull; #{resource[column_name]}</span>".html_safe
          else
            resource[column_name]
          end
        end
      end

      # Call this inside your index do...end block to make your resource sortable.
      #
      # Example:
      #
      # #app/admin/players.rb
      #
      #  ActiveAdmin.register Player do
      #    index do
      #      # This adds columns for moving up and down.
      #      sortable_tree_columns    
      #      #...
      #      column :firstname
      #      column :lastname
      #      default_actions
      #    end
      #  end
      def sortable_tree_columns
        column "&#9650;".html_safe do |resource|
          link_to("&#9650;".html_safe, self.send(:"move_up_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.left_sibling
        end
        column "&#9660;".html_safe do |resource|
          link_to("&#9660;".html_safe, self.send(:"move_down_admin_#{resource.class.model_name.underscore.gsub("/", "_")}_path", resource), :class => "arrow") if resource.right_sibling
        end
      end

      # Call this inside your resource definition to add the needed member actions
      # for your sortable resource.
      #
      # Example:
      #
      # #app/admin/players.rb
      #
      #  ActiveAdmin.register Player do
      #    # Sort players by position
      #    config.sort_order = 'lft_asc'
      #   
      #    # Add member actions for positioning.
      #    sortable_tree_member_actions
      #  end
      def sortable_tree_member_actions
        member_action :move_up do
          unless resource.left_sibling
            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_up', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
            return
          end  
          
          resource.move_left
          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_up', :resource => resource_class.to_s.camelize.constantize.model_name.human )
        end

        member_action :move_down do
          unless resource.right_sibling
            redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_down', :resource => resource_class.to_s.camelize.constantize.model_name.human ) 
            return
          end  
          
          resource.move_right
          redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_down', :resource => resource_class.to_s.camelize.constantize.model_name.human )
        end    
      end
    end
  end  
end     
