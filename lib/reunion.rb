class Reunion
  attr_reader :name, :activites

  def initialize(name)
    @name = name
    @activites = []
  end

  def add_activity(new_activity)
    activites << new_activity
  end

end
