require 'rails_helper'

RSpec.describe Locating, type: :model do
  it { should belong_to :locatable }
  it { should belong_to :location }

  it { should validate_presence_of(:locatable_type) }
  it { should validate_presence_of(:locatable_id) }
  it { should validate_presence_of(:location_id) }

  it do
    # one type of locatable is enough to check uniqueness
    create :locating, locatable: create(:news_item), location: create(:location)
    should validate_uniqueness_of(:location_id).scoped_to([:locatable_type, :locatable_id])
  end
end
