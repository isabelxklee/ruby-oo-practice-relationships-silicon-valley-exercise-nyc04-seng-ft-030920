class FundingRound
    attr_reader :startup, :vc
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, vc, type, investment)
        @startup = startup
        @vc = vc
        @type = type
        @investment = investment
        @@all << self
    end 

    def investment=(num)
        @investment = num
        if @investment > 0
            @investment = @investment.to_f
        end 
    end 

    def inspect
        "#<FundingRound from #{ self.startup.name }, #{ self.vc }, #{ self.type }, #{ self.investment }>"
    end

    def self.all
        @@all
    end 
end