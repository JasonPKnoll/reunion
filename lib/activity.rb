class Activity
  attr_reader :name, :participants, :costs

  def initialize(name)
    @name = name
    @participants = {}
    @costs = 0
  end

  def add_participant(name, cost)
    participants[name] = cost
    # Hash.new { |hash, key| hash[key] =  }
    # Hash[key] = value
  end

  def total_cost
    participants.values.map do |cost|
      cost
    end.sum
  end

  def split
    total_cost / participants.values.count
  end

  def owed
    total_split = split
    participants.each do |name, cost|
      participants[name] = total_split - cost
    end
  end

  # def total_cost
  #   all_costs = []
  #   @participants.values.map do |cost|
  #     all_costs << cost# require "pry"; binding.pry
  #   end
  #   all_costs.sum
  # end

end
