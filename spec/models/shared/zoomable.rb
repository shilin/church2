shared_examples_for 'zoomable' do
  it { should validate_presence_of :zoom }
  it { should define_enum_for(:zoom).with(Zoomable::ZOOMS) }
end
