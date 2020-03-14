class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder
        @domain = domain
        @@all << self
    end 

    def pivot(domain, name)
        @domain = domain
        @name = name
    end 

    def self.find_by_founder(founder)
        Startup.all.find { |startup|
            startup.founder == @founder
            startup
        }
    end 

    def self.domains
        domains = []
        Startup.all.select { |startup|
            domains.push(startup.domain)
        }
        domains
    end 

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end 

    def num_funding_rounds
        # loop through the funding round array
        # find the values that match a startup name
        num_funds = FundingRound.all.select { |funds|
            funds.startup == self
        }
    end

    def total_funds
        # Returns the total sum of investments that the startup has gotten
        sum = 0
        num_funding_rounds.map { |fund|
            sum += fund.investment
        }
        sum
    end 

    def investors 
        investors = []
        FundingRound.all.select { |funds|
            if funds.startup == self
                investors << funds.vc.name
            end 
        }
        investors.uniq
        # good_dog.investors[0].vc.vc_name = "Angel Investor"
        # good_dog.investors = ["Angel Investor", "Mark Cuban", "Cerberus"]
    end 

    def big_investors    
            big_investors = []
            VentureCapitalist.tres_commas_club.each { |investor|
            big_investors << investor.name
        }
        big_investors

        self.investors & big_investors
    end 

    def inspect
        "#<Startup: #{ self.name }, #{ self.founder }, #{ self.domain }>"
    end

    def self.all
        @@all
    end 

end