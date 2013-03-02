require 'spec_helper'

describe Category do
  context 'validations' do
    should { validate_presence_of(:name) }
  end # context 'validations'
end
