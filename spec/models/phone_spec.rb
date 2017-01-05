require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should have_many(:phonings).dependent(:destroy) }
  it { should have_many :congregations }
  it { should have_many :clergymen }

  it { should validate_presence_of :description }
  it { should validate_presence_of :number }

  it { should validate_uniqueness_of(:description).ignoring_case_sensitivity }

  it { should define_enum_for(:phone_type) }
end
