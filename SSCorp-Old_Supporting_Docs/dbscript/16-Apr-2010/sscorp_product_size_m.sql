/*
Script generated by Aqua Data Studio 4.5.2 on Apr-16-2010 08:04:01 AM
Database: sscorp
Schema: < All Schema >
Objects: TABLE
*/
CREATE TABLE sscorp_product_size_m ( 
	prod_size_id	int(11) AUTO_INCREMENT NOT NULL,
	prod_size   	varchar(200) NOT NULL 
	)
GO
INSERT INTO sscorp_product_size_m(prod_size_id, prod_size)
  VALUES(1, 'Available in all sizes and types')
GO
ALTER TABLE sscorp_product_size_m
	ADD CONSTRAINT PRIMARY
	PRIMARY KEY (prod_size_id)
GO
