
class Solver

    def factorial(number)
        if(number<0) 
            return "no negative number"
        else
            counter =1
            sum=1
            while counter<=number
                sum = sum * counter
                counter+=1
            end
        end
        sum
    end
end