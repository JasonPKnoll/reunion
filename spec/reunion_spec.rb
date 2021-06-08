require 'reunion'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end
  it 'Exists' do
    expect(@reunion).to be_a(Reunion)
  end

  it 'has attributes' do
    expect(@reunion.name).to eq('1406 BE')
    expect(@reunion.activites).to eq([])
  end

  it ' can add activities' do
    @reunion.add_activity(@activity_1)
    expect(@reunion.activites).to eq([@activity_1])
  end
end
