class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end 

    def self.tres_commas_club
        tres = []
        tres = VentureCapitalist.all.select { |vc|
            vc.total_worth >= 1_000_000_000
         }
        tres
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(self, startup, type, investment)
    end 

    def funding_rounds 
        funds = FundingRound.all.select { |funds|
            funds.vc == self
        }
    end 

    def portfolio 
        startups = []
        FundingRound.all.select { |funds|
            if funds.vc == self
                startups << funds.startup.name
            end 
        }
        startups.uniq
    end 

    def biggest_investment
        biggest = 0

        FundingRound.all.select { |funds|
            if funds.vc == self
                if funds.investment > biggest 
                    biggest = funds.investment
                end 

            end 
        }

        biggest
    end

    def invested(domain)
        sum = 0

        FundingRound.all.each { |fund|
            if fund.vc == self && fund.startup.domain == domain
                sum += fund.investment
            end 
        }
        sum

        # FundingRound.all[0].startup.domain
    end 

    def inspect
        "#<VentureCapitalist: #{ self.name }, #{ self.total_worth }>"
    end

    def self.all 
        @@all
    end 

end
