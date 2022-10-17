class Product 
    def initialize(description, price)
        @description = description.strip
        @price = price.strip
    end

    def getProductDescription
        @description
    end  

    def getFinalPrice
        price = (@price.to_f + getProductTaxes).round(2)
    end

    def getTaxValue
        getFinalPrice - @price.to_f
    end

    private

    def getProductTaxes
        importTaxValue = 0
        baseTaxValue = 0

        if isImported
            importTaxValue = ((5 * @price.to_f / 100) * 20).ceil.to_f / 20.0
        end

        if not isExempt
            baseTaxValue = ((10 * @price.to_f / 100) * 20).ceil.to_f / 20.0
        end

        finalTaxValue = baseTaxValue + importTaxValue
    end

    def isImported
        @description.include? 'imported'
    end

    def isExempt
        isFood || isBook || isMedical
    end

    def isFood
        @description.include? 'food'
    end

    def isBook
        @description.include? 'book'
    end

    def isMedical
        @description.include? 'medical'
    end
end