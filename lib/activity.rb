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
    all_costs = []
    @participants.values.map do |cost|
      cost# require "pry"; binding.pry
    end.sum
  end

  # def total_cost
  #   all_costs = []
  #   @participants.values.map do |cost|
  #     all_costs << cost# require "pry"; binding.pry
  #   end
  #   all_costs.sum
  # end

end
