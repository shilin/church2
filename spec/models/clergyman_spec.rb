require 'rails_helper'

RSpec.describe Clergyman, type: :model do
  it_behaves_like 'phonable'

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :rank }

  it { should define_enum_for(:rank) }

  it 'has full_name method' do
    expect(create(:clergyman).full_name).to eq 'MyFirstClergymanName MyLastClergymanName'
  end
end
