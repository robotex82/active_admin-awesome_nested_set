require 'spec_helper'

describe "ActiveRecord::Base models" do
  ActiveRecord::Base.descendants.map(&:to_s).reject() { |m| %w(ActiveAdmin::Comment AdminUser).include?(m) }.each do |model_name|
    model = model_name.constantize
    describe model do
      it "should be an ActiveRecord::Base" do
        ActiveRecord::Base.descendants.should include(model)
      end

      it "should be instanciable" do
        instance = model.new
        instance.should be_a model
      end

      it "should be valid with correct attribute values" do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.gsub( '/', '_'))
        instance.should be_valid
      end

      it "should not be valid with empty attributes" do
        instance = model.new
        instance.should_not be_valid
      end

      it "should save with valid attributes" do
        instance = FactoryGirl.create(model.to_s.tableize.singularize.underscore.gsub( '/', '_'))
        instance.save.should be_true
        instance.should be_persisted
      end
    end
  end
end

