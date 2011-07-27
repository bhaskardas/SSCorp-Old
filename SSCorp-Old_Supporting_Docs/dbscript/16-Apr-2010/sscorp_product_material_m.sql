/*
Script generated by Aqua Data Studio 4.5.2 on Apr-16-2010 08:04:01 AM
Database: sscorp
Schema: < All Schema >
Objects: TABLE
*/
CREATE TABLE sscorp_product_material_m ( 
	prod_mat_id       	int(11) AUTO_INCREMENT NOT NULL,
	prod_material_name	varchar(200) NOT NULL 
	)
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(1, 'Cast Iron')
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(2, 'Metal Sheet')
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(3, 'PVC')
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(4, 'Aluminium Casting')
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(5, 'Galvanised Strip')
GO
INSERT INTO sscorp_product_material_m(prod_mat_id, prod_material_name)
  VALUES(6, 'Wire')
GO
ALTER TABLE sscorp_product_material_m
	ADD CONSTRAINT PRIMARY
	PRIMARY KEY (prod_mat_id)
GO