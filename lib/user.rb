require 'pry'
class User
  attr_reader :name, :jokes
  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(name, joke_num)
    name.learn(joke_num)
  end

  def joke_by_id(id)
    @jokes.each do |joke|
      if joke.id == id
        return joke
      end
    end
  end
end
