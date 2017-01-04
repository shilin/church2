shared_examples_for 'having_addresses' do
  it { should have_many(:addressings).dependent(:destroy) }
  it { should have_many(:addresses) }
end
