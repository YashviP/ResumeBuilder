module ResumeBuilder
  module Validation
    def is_first_name_valid?
        name_regex = /^[A-Za-z]+$/
    	if(self.first_name=='')
    		raise "\n\nError: first name should not be blank" 
    	end
        if(self.first_name =~ name_regex)

        else
            raise "\n\nError: First name should contains only alphabets"
        end
    end

    def is_last_name_valid?
        name_regex = /^[A-Za-z]+$/
        if(self.last_name=='')
            raise "\n\nError: Last name should not be blank" 
        end
        if(self.last_name =~ name_regex)

        else
            raise "\n\nError: Last name should contains only alphabets"
        end
    end

    def greater_than_eq_18?
    	if(self.age<18)
    		raise " Error : Age should be greater than or equal to 18"
    	end      
    end

    def gender_valid? 
        if((["MALE","FEMALE","OTHER"].include? self.gender.upcase)==false)
            raise "Error : Please enter valid gender"
        end
    end

  end
end
