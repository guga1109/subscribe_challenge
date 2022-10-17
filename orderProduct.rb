class OrderProduct
	def initialize(product, quantity)
		@product = product
		@quantity = quantity
	end

	def getProductOrderDescription
        "#{@quantity} #{@product.getProductDescription}: %.2f" % getProductOrderTotalValue
	end

	def getProductOrderTotalValue
		@product.getFinalPrice * @quantity
	end

	def getProductOrderTotalTaxValue
		@product.getTaxValue * @quantity
 	end
end