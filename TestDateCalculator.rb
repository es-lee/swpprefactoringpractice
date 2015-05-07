require_relative "DateCalculator"
require "minitest/autorun"

class TestDateCalculator < Minitest::Test
  def helper_leapyear(year)
    calc = DateCalculator.new(0)
    calc.year = year
    return calc.leap_year?
  end

  def test_leapyear
    assert helper_leapyear(2004)

    assert_equal(false, helper_leapyear(1900))

    assert helper_leapyear(2000)
  end
end
