require_relative "product"

products = []

while true
	inpt = STDIN.gets.chomp

	if inpt == 'q'
		break
	end

	quantity = inpt[0, inpt.index(' ')]
	price = inpt[inpt.rindex(' ') + 1, inpt.length-1]
	product = inpt[inpt.index(' ') + 1, inpt.rindex(' ') - 1]
	product.slice! " at "

	p = Product.new(product, price, quantity)
	products.push(p)
end

products.each do |product|
	puts product.getOrderDescription
end

totalSaleTaxValue = 0
totalSaleValue = 0

for product in products
	totalSaleTaxValue += product.getTotalTaxValue
	totalSaleValue += product.getTotalPrice
end

puts 'Sales Taxes: %.2f' % totalSaleTaxValue
puts 'Total: %.2f' % totalSaleValue