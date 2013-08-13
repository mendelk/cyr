require 'time'

require_relative 'user'

class UsersParser

  class << self

    def parse(line, delimiter)
      case delimiter
      when '|'
        last_name,
        first_name,
        middle_initial,
        gender,
        favorite_color,
        date_of_birth = line.split(delimiter).map(&:strip)
        m,d,y = date_of_birth.split('-')
      when ','
        last_name,
        first_name,
        gender,
        favorite_color,
        date_of_birth = line.split(delimiter).map(&:strip)
        m,d,y = date_of_birth.split('/')
      when ' '
        last_name,
        first_name,
        middle_initial,
        gender,
        date_of_birth,
        favorite_color = line.split(delimiter).map(&:strip)
        m,d,y = date_of_birth.split('-')
      else
        raise "Delimiter '#{delimiter}' Not Recognized."
      end

      gender = massage_gender(gender)

      date_of_birth = Date.strptime "#{m}/#{d}/#{y}", '%m/%d/%Y'

      User.create(last_name: last_name, first_name: first_name, middle_initial: middle_initial, gender: gender, favorite_color: favorite_color, date_of_birth: date_of_birth)

    end

    def massage_gender(gender)
      if gender == 'M'
        return 'Male'
      elsif gender == 'F'
        return 'Female'
      else
        return gender
      end
    end

  end

end