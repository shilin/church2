shared_examples_for 'phonable' do
  it { should have_many(:phonings) }
  it { should have_many(:phones) }
end
