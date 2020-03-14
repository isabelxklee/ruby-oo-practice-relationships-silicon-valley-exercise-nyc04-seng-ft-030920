require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

stash = Startup.new("Stash", "Bob", "Finance")
good_dog = Startup.new("Good Dog", "Lauren", "Dogs")
glossier = Startup.new("Glossier", "Taylor", "Makeup")
stash.pivot("Food", "Uncommon Goods")
Startup.all
Startup.domains
Startup.find_by_founder("Lauren")

mark = VentureCapitalist.new("Mark Cuban", 659_000)
angel = VentureCapitalist.new("Angel Investor", 2_243_000_000)
cerberus = VentureCapitalist.new("Cerberus", 5_000_000_000)
VentureCapitalist.all
VentureCapitalist.tres_commas_club

stash.sign_contract(angel, "Series A", 100_000)
stash.sign_contract(mark, "Series A", 250_000)
good_dog.sign_contract(angel, "Series A", 500_000)
good_dog.sign_contract(mark, "Series B", 10_000)
good_dog.sign_contract(cerberus, "Series C", 25_555_000_000)
glossier.sign_contract(mark, "Series A", 100_000)
glossier.sign_contract(cerberus, "Series B", 650_000)

good_dog.num_funding_rounds
good_dog.total_funds
good_dog.investors
good_dog.big_investors

mark.offer_contract(good_dog, "Series A", 1000)
cerberus.invested("Makeup")

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line