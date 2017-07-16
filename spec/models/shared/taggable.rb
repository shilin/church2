shared_examples_for 'taggable' do
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:tags) }
end
