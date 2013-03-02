FactoryGirl.define do
  factory :category do
    sequence(:name) { |i| "Category ##{i}" }

    factory :subcategory do
      association :parent, :factory => :category
    end
  end
end

