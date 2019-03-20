require './lib/open_mic'
require './lib/joke'
require './lib/user'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class UserTest < Minitest::Test
  def test_it_exists
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_instance_of OpenMic, open_mic
  end

  def test_location_and_date
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    assert_equal "Comedy Works", open_mic.location
    assert_equal "11-20-18", open_mic.date
  end

  def test_preformer_and_welcome
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    assert_equal [], open_mic.preformer
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    assert_equal [sal, ali], open_mic.preformer
  end

  def test_repeate_joke
    open_mic = OpenMic.new({location: "Comedy Works", date: "11-20-18"})
    sal = User.new("Sal")
    ali = User.new("Ali")
    open_mic.welcome(sal)
    open_mic.welcome(ali)
    joke_1 = Joke.new(1, "Why did the strawberry cross the road?", "Because his mother was in a jam.")
    joke_2 = Joke.new(2, "How do you keep a lion from charging?", "Take away its credit cards.")
    ali.learn(joke_1)
    ali.learn(joke_2)
    assert_equal false, open_mic.repeated_jokes?
    ali.tell(sal, joke_1)
    assert_equal true, open_mic.repeated_jokes?
  end
end
