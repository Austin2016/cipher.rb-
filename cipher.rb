#caesar cipher program that takes in a string and a number, and shifts each letter 
#to the right by that given number. Keeps the capitalization in tact. 

=begin 
Quick Tips:

You will need to remember how to convert a string into a number.
Don’t forget to wrap from z to a.
Don’t forget to keep the same case.

=end 

#each letter must have a number
#convert them to their numbers, add shift, convert back (include wrap)
#ignore characters that aren't letters 
#a.index { |x| ['c'].include?(x) }  ... this finds the index of c in array a 

 
def is_integer?(input)              # simpl method to figure out if an input is an integer
 if input == input.to_i
  return true  
 else 
  return false 
 end 
end 

def cap_rememberer(string)
 j = 0
 string_array=string.split("") 
 y = []

 string_array.each { |x| 
  if x == x.downcase
  
   y[j] = 0
   
   j+=1
  
  else 
  
   y[j]=1
   
   j+=1

  end  
 }

y 

end



 	 


def caesar_cipher(message,shift) 
	caps_code = cap_rememberer(message) #store which positions need to be capitalized later

	alphabet = ("a".."z").to_a       #array of al the letters
	possible_numbers =(0..25).to_a   #array of all the possible indices 
	i = 0                            # initialize counter 
    index_array = []                 #initialize array to store number

	
	message = message.split("")      #convert message string to an array 


	message.each { |x| x.downcase! } # convert everything to lower case to make it easier 


	message.each { |x|               # converts all the letters in the message to numbers
	if alphabet.include?(x) 
	 	index_array[i] = alphabet.index(x) 
	 	i+=1 
	else
	 index_array[i] = x 
	 i+=1 
	end 

	}

	i = 0                            #reset i 

	index_array.each { |x|           #apply shift  

	if possible_numbers.include?(x) 
	 index_array[i] += shift
	 i+=1	
    else
     i+=1
    end 

	}

	i = 0 
 
	index_array.each { |x|          #make sure z wraps correctly back to the start 
	 if is_integer?(index_array[i]) && index_array[i]>25 
      index_array[i] = index_array[i] - 26
      i+=1 
 	 else 
 	  i+=1
	 end 




	}

	i = 0 
     
    index_array.each { |x|             #convert shifted numbers to shifted letters!
     if is_integer?(index_array[i])
      index_array[i] = alphabet[index_array[i]]
      i+=1
     else 
      i+=1
     end



    }


    i=0
    
    until i == index_array.length do
     if caps_code[i] == 1 
  
      index_array[i] = index_array[i].upcase 
      i+=1
 
     else
      i+=1
    
     end  
    end 
    

puts index_array.join("") 


end 



caesar_cipher("hey! you!",4)
caesar_cipher("zzz",-1)
caesar_cipher("zzz",1)
caesar_cipher("ZZZ",1)
caesar_cipher("ABC 1! aaa",1)



=begin




	
=end

