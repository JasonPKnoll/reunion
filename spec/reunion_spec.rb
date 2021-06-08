require 'reunion'
require 'activity'

describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
  end
  it 'exists' do
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

  it 'Can give the total costs for all added activites' do
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    expect(@reunion.total_cost).to eq(60)

    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    expect(@reunion.total_cost).to eq(180)
  end

  it 'return who owes how much money from all activites' do
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    expect(@reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    expect(@reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end
end
