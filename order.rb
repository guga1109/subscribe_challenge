class Order
	@products

	def initialize
		@products = Array.new
	end

	def addNewProduct(product)
		@products.push(product)
	end

	def getTotalOrderValue
		totalOrderValue = 0

		for product in @products
			totalOrderValue += product.getTotalPrice
		end

		totalOrderValue
	end

	def getTotalOrderTaxValue
		totalOrderTaxValue = 0

		for product in @products
			totalOrderTaxValue += product.getTotalTaxValue
		end

		totalOrderTaxValue.ceil(2)
	end

	def getOrderDescription
		@products.each do |product|
			puts product.getProductSaleDescription
		end
	end
end