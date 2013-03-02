ActiveAdmin.register Category do
  # Set the default sort order.
  config.sort_order = 'lft_asc'

  # Add member actions for positioning.
  sortable_tree_member_actions

  form do |f|
    f.inputs do
      f.input :parent
      f.input :name
    end # f.inputs
    f.actions
  end # form

  index do
    # This adds columns for moving up, down, top and bottom.
    sortable_tree_columns

    sortable_tree_indented_column :name
    default_actions
  end # index
end # ActiveAdmin.register Category

