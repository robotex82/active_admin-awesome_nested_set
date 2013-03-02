require 'spec_helper'

feature 'Sortable tree' do
  include ActiveAdmin::SignInHelper

  background do
    I18n.locale = :en
    admin_user = FactoryGirl.create(:admin_user)
    sign_in_with(admin_user.email, admin_user.password)
  end # before

  describe 'Sorting parent items on the admin index page' do
    before do
      @first_parent = FactoryGirl.create(:category, :parent => nil)
      @second_parent = FactoryGirl.create(:category, :parent => nil)
      visit '/admin/categories'
    end # before

    describe 'Move first item to the second place' do
      before do
        find(:xpath, "//a[@href='/admin/categories/#{@first_parent.to_param}/move_down']").click
      end # before

      scenario 'should have the status code 200' do
        page.status_code.should eq(200)
      end # scenario

      scenario 'should redirect to the index page' do
        page.current_path.should eq("/admin/categories")
      end # scenario

      scenario 'should move the item to the second place' do    
        page.find(:xpath, "(//td[@class='name'])[1]").text.should eq(@second_parent.name)
        page.find(:xpath, "(//td[@class='name'])[2]").text.should eq(@first_parent.name)
      end # scenario
    end
  end #   describe 'Sorting parent items on the admin index page'

  describe 'Item indentation' do
    before do
      @child = FactoryGirl.create(:subcategory)
      @parent = @child.parent
      visit '/admin/categories'
    end # before

   it 'should not indent the parent item' do
     page.should have_css("span[style='padding-left:0px']", :text => "&bull; #{@parent.name}")
   end # it

   it 'should indent the child item' do
   end # it
  end # describe 'Item indentation'
end # feature 'Sortable tree'
