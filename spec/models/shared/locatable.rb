shared_examples_for 'locatable' do
  it { should have_many(:locatings).dependent(:destroy) }
  it { should have_many(:locations) }
end
