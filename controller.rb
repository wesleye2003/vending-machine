require_relative "models/machine"

def start(machine)
  sleep 0.5
  puts "Type 'help' to see a list of commands."
  sleep 0.5
  puts "\n"
  puts machine.display
  input = STDIN.gets.chomp.downcase.split
  puts "\n"

  if input[0] == 'products'
    puts "Products: "
    puts machine.products.map { |item| item.name }.uniq
  elsif input[0] == 'insert'
    if input [1] == 'quarter'
      machine.add_coin(Coin.new({weight: 5.67, diameter: 24.26, thickness: 1.75}))
    elsif input [1] == 'dime'
      machine.add_coin(Coin.new({weight: 2.27, diameter: 17.91, thickness: 1.35}))
    elsif input [1] == 'nickel'
      machine.add_coin(Coin.new({weight: 5, diameter: 21.21, thickness: 1.95}))
    else
      input[1] = "invalid coin"
    end
    puts "#{input[1]} inserted!"
  elsif input[0] == 'display'
    machine.show_inserted_value
  elsif input[0] == 'choose'
    chosen_item_index = machine.products.index { |item| item.name.downcase  == input[1]}
    if chosen_item_index
      machine.try_to_sell(machine.products[chosen_item_index])
    else
      machine.try_to_sell(input[1])
    end
  elsif input == ["return", "coins"]
    puts "You get #{machine.inserted_value} cents back."
    machine.return_inserted_value
  elsif input[0] == 'quit'
    return
  elsif input[0] == 'help'
    puts "'products' - Show the names of all products."
    puts "'insert ____' - Type 'quarter', 'dime', or 'nickel' to choose which coin to insert into the machine."
    puts "'display' - View the display on the vending machine."
    puts "'choose ____' - Type a product name to purchase it or see its price."
    puts "'return coins' - Return any coins you put in the machine."
    puts "'quit' - Quit the vending machine."
  else
    puts "invalid command!"
  end
  puts "\n"
  start(machine)
end

if ARGV[0].downcase == "start"
  machine = Machine.new()
  machine.coins = {'quarter' => 5, 'dime' => 5, 'nickel' => 5}
  5.times do
    machine.add_product(Product.new({name: "Chips", price: 50}))
    machine.add_product(Product.new({name: "Cola", price: 100}))
    machine.add_product(Product.new({name: "Candy", price: 65}))
  end
  machine.show_inserted_value

  puts "Welcome to the vending machine!"
  start(machine)
end
