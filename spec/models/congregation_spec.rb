require 'rails_helper'

RSpec.describe Congregation, type: :model do
  it { should have_one(:locating).dependent(:destroy) }
  it { should have_one(:location) }

  it { should validate_presence_of :name }
end
