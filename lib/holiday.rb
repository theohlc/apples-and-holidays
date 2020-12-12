require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |day, stuff|
    stuff << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash.each do |time_of_year, holiday_list_hash|
    #binding.pry
    if time_of_year == season
      holiday_list_hash[holiday_name] = supply_array
    end
  end

end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |time_of_year, holiday_list_hash|
    puts time_of_year.to_s.capitalize + ":"
    holiday_list_hash.each do |holiday_name, supply_array|
      holiday_string = holiday_name.to_s
      holiday_string = holiday_string.split("_")
      #binding.pry
      #holiday_string = holiday_string.join(" ") if holiday_string.class == Array 
      if holiday_string.class == Array
        holiday_string.collect do |word|
          word.capitalize!
        end
        holiday_string = holiday_string.join(" ")
      end

      puts "  " + holiday_string + ": " + supply_array.join(", ")
      
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_array = []

  holiday_hash.each do |season, holiday_list_hash|
    holiday_list_hash.each do |holiday, supply_array|
      holiday_array << holiday if supply_array.include?("BBQ")
    end
  end

  holiday_array
end







