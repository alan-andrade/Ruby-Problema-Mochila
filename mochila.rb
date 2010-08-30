## Mochila ##

class Mochila

	attr_accessor :objects_array, :weights_array, :solutions, :weight, :nelements
	
	def initialize(nelements, weight)
		@nelements = nelements
		@weight = weight+1
		@solutions = Array.new(nelements) { Array.new(weight+1) }
		@objects_array = Array.new(nelements)
		@weights_array = Array.new(nelements)
	end
	
	def fillObjectsValues
		@objects_array.each_with_index do |object, index|
			puts "Give Value of Object #{index}"
			@objects_array[index] = gets.chomp.to_i
		end
	end
	
	def fillObjectsWeights
		@weights_array.each_with_index do |object, index|
			puts "Give Weight for Object #{index}"
			@weights_array[index] = gets.chomp.to_i
		end
	end
		
	def optimalSolution
		for i in 0..@nelements-1
			@solutions[i][0] = 0
			for j in 0..@weight-1
				solutionsNiceLook
				if i == 0 and j < @weights_array[i]
					@solutions[i][j] = 0
				elsif i == 0
					@solutions[i]	[j] = @objects_array[i]
				elsif j < @weights_array[i]
					@solutions[i][j] = @solutions[i-1][j]
				else
					@solutions[i][j] = max(i, j)
				end
			end
		end	
    @solutions[@nelements - 1][@weight - 1];
	end
	
	def optimalCharge

    j = @weight - 1;
    i = @nelements - 1;
    
    while ( (i >= 0) and (j >= 0))
      if ( (j - @weights_array[i]) >= 0)
        if (i > 0)
          if (@solutions[i][j] == @solutions[i - 1][j - @weights_array[i]] + @objects_array[i])
           	puts "Incluimos en la mochila el objeto de valor:  #{@objects_array[i]} con peso #{@weights_array[i]}"
	         	 j -= @weights_array[i]
          end
        end
        elsif (@solutions[i][j] == @objects_array[i])
          puts "Incluimos en la mochila el objeto de valor:  #{@objects_array} de peso #{@weights_array }"         
	      end
	      i -= 1
	    end
	end
	
	def max(i,j)
		x = @solutions[i-1][j]
		y = @objects_array[i] + @solutions[i-1][j - @weights_array[i]]
		if x>y
		 	x
		else
			 y
		end	
	end
	
	def solutionsNiceLook
		print "\t\t"
		@solutions[0].each_index {|index| print "Peso: #{index} \t"}
		puts
		@solutions.each_index do |index|
			print "Objecto #{index}\t"
			@solutions[index].each {|obj| print obj; print "\t\t" }
			print "\n"		
			if index == @solutions.size-1
				puts
			end
		end
	end
end

#puts "Number of Elements:"
#elements = gets.chomp.to_i
#puts "Max Weight:"
#weight = gets.chomp.to_i
#mochila = Mochila.new(elements, weight)
mochila = Mochila.new(4, 7)
#mochila.fillObjectsValues
#mochila.fillObjectsWeights
mochila.objects_array = [1, 3, 5, 7]
mochila.weights_array = [1, 2, 3, 4]
mochila.optimalSolution
puts
mochila.optimalCharge
puts
mochila.solutionsNiceLook


