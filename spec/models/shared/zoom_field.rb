shared_examples_for 'zoom_field' do
  it { should validate_presence_of :zoom }
  it { should define_enum_for(:zoom).with(ZoomField::ZOOMS) }
end
