/*
Script generated by Aqua Data Studio 4.5.2 on Apr-16-2010 08:04:01 AM
Database: sscorp
Schema: < All Schema >
Objects: TABLE
*/
CREATE TABLE sscorp_phone_numbers_m ( 
	phone_id    	int(11) AUTO_INCREMENT NOT NULL,
	phone_owner 	varchar(100) NOT NULL,
	country_code	varchar(10) NULL,
	std_code    	varchar(10) NULL,
	phone_number	varchar(20) NOT NULL,
	company_id  	int(11) NULL 
	)
GO
INSERT INTO sscorp_phone_numbers_m(phone_id, phone_owner, country_code, std_code, phone_number, company_id)
  VALUES(1, 'Rakesh Kumar Jain', '91', NULL, '9999769217', 1)
GO
INSERT INTO sscorp_phone_numbers_m(phone_id, phone_owner, country_code, std_code, phone_number, company_id)
  VALUES(2, 'Rajeev Kumar Jain', '91', NULL, '9999769216', 1)
GO
INSERT INTO sscorp_phone_numbers_m(phone_id, phone_owner, country_code, std_code, phone_number, company_id)
  VALUES(3, 'Naman Jain', '91', NULL, '9999657866', 1)
GO
ALTER TABLE sscorp_phone_numbers_m
	ADD CONSTRAINT PRIMARY
	PRIMARY KEY (phone_id)
GO
ALTER TABLE sscorp_phone_numbers_m
	ADD CONSTRAINT phone_number_fk
	FOREIGN KEY(company_id)
	REFERENCES sscorp_companyProfile_m(company_id)
GO