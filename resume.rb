module ResumeBuilder
  class Resume
    include ::ResumeBuilder::Validation
    
    attr_accessor :first_name, :last_name,
                  :age, :gender
    
    def save
      require "csv"
      puts "saving your data......."
      file_name=@first_name + "data.csv"
      CSV.open(file_name, "wb") do |fout|
        fout<<["first_name","last_name","age","gender"]
        fout<<[@first_name,@last_name,@age,@gender]
      end
    end


    def enter_user_first_name
      puts "Please enter first name"
      first_name = gets.chomp
      @first_name = first_name
    end

    def enter_user_last_name
      puts "Please enter last name"
      last_name = gets.chomp
      @last_name = last_name
    end

    def enter_user_age
      print "Please enter your age (>=18)"
      age = Integer(gets.chomp)
      @age = age
    end

    def enter_user_gender
      puts "Please enter your gender (Male/Female/Other)"
      gender=gets.chomp
      @gender = gender 
    end

    def self.build
      user = self.new
      operations = {
          enter_user_first_name: :is_first_name_valid?,
          enter_user_last_name:  :is_last_name_valid?,
          enter_user_age:        :greater_than_eq_18?,
          enter_user_gender:     :gender_valid?
      }

      operations.each do |input,validate|
          begin 
              user.send(input)
              user.send(validate)
          rescue => e
            puts e
            retry
          else
            next
          end
      end

      user.save
      p "Do you want to create another resume? (Y/N)"
      ans = gets.chomp
      if(ans.upcase=="Y" or ans.upcase=="YES")
        self.build
      elsif(ans.upcase=="N" or ans.upcase== "NO")
        return
      end

    end

  end

end



