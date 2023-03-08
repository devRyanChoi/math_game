class Players
  attr_accessor :lives, :name

  def initialize(name)
      @name = name
      @lives = 3
  end

  def takeLive
      @lives -= 1
  end

  def dead
      @lives == 0
  end
end