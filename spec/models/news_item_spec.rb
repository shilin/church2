require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  it_behaves_like 'zoom_field'
  it_behaves_like 'locatable'
  it_behaves_like 'taggable'

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
