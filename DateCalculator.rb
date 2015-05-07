class DateCalculator
  attr_accessor :days, :year
  def initialize(days)
    @days = days
    @year = 1980
  end

  def convert() # static method. not good!
    while (@days >= 365) do
      if leap_year?
        add_leap_year
        if (@days == 365)
          break
        end
      else
        add_regular_year
      end
    end
    return @year
  end

  def leap_year?
    (@year % 400 == 0 ||
      (@year % 4 == 0 && @year % 100 != 0))
  end

  def add_leap_year
    if (@days >= 366)
      @days -= 366
      @year += 1
    end
  end

  def add_regular_year
    if (@days >= 365)
      @days -= 365
      @year += 1
    end
  end

end


if __FILE__ == $0
    year = DateCalculator.new(ARGV[0].to_i)
    puts year.convert
end

# pseudo code

# start with Year = 1980
# while (days remaining > 365)
#   if Year is a leap year
#       then if possible, peel off 366 days and advance Year by 1
#   else
#       peel off 365 days and advance Year by 1
# return Year
