require 'rails_helper'

RSpec.describe Addressing, type: :model do
  it { should belong_to :addressable }
  it { should belong_to :address }

  it { should validate_presence_of :addressable_type }
  it { should validate_presence_of :addressable_id }
  it { should validate_presence_of :address_id }

  it do
    # one type of locatable is enough to check uniqueness
    create(:addressing, address: create(:address), addressable: create(:congregation))
    should validate_uniqueness_of(:address_id).scoped_to([:addressable_type, :addressable_id])
  end
end
