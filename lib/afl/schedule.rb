module AFL
  class Schedule

    def next_match(team_name, date = Time.now)
      Season.new(date.year, team_name).next_match
    end
  end
end