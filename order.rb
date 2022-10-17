class Order
	@orderProducts

	def initialize
		@orderProducts = Array.new
	end

	def addNewProduct(product)
		@orderProducts.push(product)
	end

	def getTotalOrderValue
		totalOrderValue = 0

		for product in @orderProducts
			totalOrderValue += product.getProductOrderTotalValue
		end

		totalOrderValue
	end

	def getTotalOrderTaxValue
		totalOrderTaxValue = 0

		for product in @orderProducts
			totalOrderTaxValue += product.getProductOrderTotalTaxValue
		end

		totalOrderTaxValue.ceil(2)
	end

	def getOrderDescription
		@orderProducts.each do |product|
			puts product.getProductOrderDescription
		end
	end
end