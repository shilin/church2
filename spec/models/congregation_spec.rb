require 'rails_helper'

RSpec.describe Congregation, type: :model do
  it { should validate_presence_of :name }
end
