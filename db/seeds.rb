# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Create Categories
Category.create([{ name: 'Books' }, { name: 'Kindle Store' },{ name: 'Electronics' },{ name: 'Computers & Accessories' },
				 {name: 'Software' }, {name: 'Office Products' }])

#Create Manufacturers
Manufacturer.create([{ name: 'Apple' }, { name: 'Microsoft' },{ name: "O'Reilly" },{ name: 'Google' },
				 		{name: 'IKEA' }])

Photo.create({description:"Book Cover", url: "http://ecx.images-amazon.com/images/I/51WIpM70FEL._SL500_AA240_.jpg"})
Product.create({name:"The C Programming Language (2nd Edition)", description:
	"An indisputably classic computing text, Kernighan and Ritchie's The C Programming
      Language, 2nd Edition , is the standard reference for learning and using ANSI C." ,price:1232, category_id:1, manufacturer_id:1, photos:[Photo.last]})
   
   
Photo.create({description:"This is the great cover", url: "http://ecx.images-amazon.com/images/I/51TGEPRTDNL._SL500_AA240_.jpg"})
Product.create({name:"The Mythical Man Month and Other Essays on Software Engineering", description:
	"Few books on software project management have been as influential and timeless as
      The Mythical Man-Month ." ,price:17, category_id:1, manufacturer_id:4, photos:[Photo.last]})
   


      
    