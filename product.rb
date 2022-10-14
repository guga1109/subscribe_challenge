class Product 
  def initialize(description, price, quantity)
    @description = description.strip
    @price = price.strip
    @quantity = quantity.strip
  end

	def getOrderDescription
		"#{@quantity} #{@description}: %.2f" % getFinalPrice
	end  

  def getTotalPrice
    getFinalPrice
  end

  def getTotalTaxValue
    getFinalPrice - (@price.to_f * @quantity.to_f)
  end

  private

  def getFinalPrice
    price = (@price.to_f + getProductTaxes).round(2) * @quantity.to_i
  end
  
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