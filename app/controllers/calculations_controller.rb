class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.gsub(" ","").length

    @word_count = @text.split.count

    @occurrences = @text.downcase.split.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
    r = @apr/1200
    n = @years*12
    d = (1+r)**n - 1
    num =@principal*r*(1+r)**n

    @monthly_payment = num/d

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    avg_weeks = 0.75*52.1428571429 + 0.25*52.2857142857

    @seconds = @ending - @starting
    @minutes = @seconds/60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/avg_weeks

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    if @count.odd? == true
        @median = @sorted_numbers[(@count)/2]
    else
        @median = (@sorted_numbers[(@count-1)/2] + @sorted_numbers[@count/2])/2
    end

    @sum = @numbers.sum

    @mean = @sum/@count

def variance(numlist)
 variance = 0
 numlist.each do |number|
 variance = variance + ((number - @mean) ** 2) / @count
 end
 return variance
 end

@variance = variance(@numbers)

def standard_deviation(list_of_numbers)
  return variance(list_of_numbers) ** (0.5)
end

@standard_deviation = standard_deviation(@numbers)

  def mode(array)
      counter = Hash.new(0)
      array.each do |i|
        counter[i] += 1
    end

    mode_array = []

    counter.each do |k, v|
        if v == counter.values.max
          mode_array << k
      end
    end
    mode_array.sort
    end

    @mode = mode(@numbers)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
