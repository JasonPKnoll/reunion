require 'activity'

describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  it 'exists' do
    expect(@activity).to be_a(Activity)
  end

  it 'has attributes' do
    expect(@activity.name).to eq("Brunch")
    expect(@activity.participants).to eq({})
  end

  it 'can add participants' do
    @activity.add_participant("Maria", 20)
    expect(@activity.participants).to eq({"Maria" => 20})
    expect(@activity.costs).to eq(20)

    @activity.add_participant("Luther", 40)
    expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    expect(@activity.costs).to eq(60)
  end
end
