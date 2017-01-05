require 'rails_helper'

RSpec.describe Phoning, type: :model do
  it { should belong_to :phonable }
  it { should belong_to :phone }

  it { should validate_presence_of :phonable_type }
  it { should validate_presence_of :phonable_id }
  it { should validate_presence_of :phone_id }

  it do
    # one type of phonable is enough to check uniqueness
    create(:phoning, phone: create(:phone), phonable: create(:congregation))
    should validate_uniqueness_of(:phone_id).scoped_to([:phonable_type, :phonable_id])
  end
end
