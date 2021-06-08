class Reunion
  attr_reader :name, :activites

  def initialize(name)
    @name = name
    @activites = []
  end

  def add_activity(new_activity)
    activites << new_activity
  end

  def total_cost
    activites.map do |activity|
      activity.total_cost
    end.sum
  end
  # BREAKOUT
  # activities inside of the reunion
  # need totals that each participant has from each activity

  def breakout
    # total_hash = Hash.new(0) # the zero in () sets the default value to 0
    # Hash.new { |hash, key| hash[key] = 0 }
    # activites.each do |activity|
    #   activity.owed.each do |name, amount|
    #     total_hash[name] += amount
    total_hash =  Hash.new(0)
    activites.map do |activity|
      difference = (activity.total_cost / activity.participants.count)
      activity.participants.each do |name, cost|
        costs = difference - cost
        (total_hash[name] += costs)
      end
    end
    total_hash.merge
  end

  def summary
    summary = ""
    # breakout #{"Maria"=>-10, "Luther"=>-30, "Louis"=>40}
    breakout.each do |name, amount|
      summary += "#{name.to_s}: #{amount.to_s}\n"
    end
    summary.chomp # takes off the last \n
  end
end
