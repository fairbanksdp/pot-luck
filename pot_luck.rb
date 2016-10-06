require './scan'
people = open('people.csv')
$people = people.each_line.map do|txt|
  name,email,guests,food = txt.split(',')
  arr = [name,email,guests,food]
end 
people.close
foods = open('foods.csv')
$foods = foods.each_line.map {|txt|txt}
foods.close

def guest()
  guest_count = 0
  $people.each do|txt|
    n,n,guests =  ("#{txt}").split(',')
    guest_count += guests.to_i + 1
  end
  guest_count
end

print guest
print "\n"

def rsvp()
  info = scan.chomp
  if invalid_request?(info)
    print "Error. Try again. \n"
    rsvp
  else 
    people = open('people.csv','a')
    people.write info
    people.close
    
    n,n,n,food = info.split(',')
    $foods.delete("#{food}")
    $foods.push(nil)
    foods = open('foods.csv','w')
    $foods.each do|info|
      foods.write info
    end

    foods.close
        
  end
end

def invalid_request?(info)
  name, email, guests, food = info.split(',')
  if guests.to_i < 1 || guests.to_i > 10
    return false
  end
  if $foods.include?(food)
    return true
  end
  false
end

rsvp
