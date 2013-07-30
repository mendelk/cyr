class User

  USERS = []

  attr_reader :last_name, :first_name, :gender, :date_of_birth, :favorite_color

  def initialize(args = {})

    @last_name      = args[:last_name]
    @first_name     = args[:first_name]
    @gender         = args[:gender]
    @date_of_birth  = args[:date_of_birth]
    @favorite_color = args[:favorite_color]

  end

  def save
    USERS.push self
  end

  class << self

    def create(args = {})
      user = self.new(args)
      user.save
      return user
    end

    def all
      USERS
    end

    def sort_by(*fields)
      all.sort_by{ |user| fields.map{ |field| user.send(field) } }
    end

    def clear
      USERS.clear
    end

  end

end

# require 'pry'
# pry