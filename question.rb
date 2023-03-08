require "./players"

class Questions
    attr_accessor :answer, :number1, :number2

    def initialize()
        @number1 = rand(1...20)
        @number2 = rand(1...20)
        @answer = @number1 + @number2
        puts @answer
    end

    def check_answer (player)
        if(@input_answer == @answer)
            puts "Correct!"
        else
            puts "Wrong!"
            player.takeLive
        end
    end

    def ask(player)
        puts "#{player.name} : What is #{@number1} + #{@number2}"

        @input_answer = $stdin.gets.chomp.to_i

        check_answer(player)
    end

end