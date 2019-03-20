require 'pry'
class OpenMic
  attr_reader :location, :date, :preformer
  def initialize(hash)
    @hash = hash
    @location = hash[:location]
    @date = hash[:date]
    @preformer = []
  end

  def welcome(name)
    @preformer << name
  end

  def repeated_jokes?
    if 
    @preformer[1].jokes.each do |joke|
      joke.id
    binding.pry

        end
      end
