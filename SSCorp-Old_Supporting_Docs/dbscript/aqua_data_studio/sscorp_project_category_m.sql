/*
Script generated by Aqua Data Studio 4.5.2 on Feb-01-2010 09:16:29 PM
Database: sscorp
Schema: < All Schema >
Objects: TABLE
*/
CREATE TABLE sscorp_project_category_m ( 
	project_cat_id  	int(11) AUTO_INCREMENT NOT NULL,
	project_category	varchar(200) NOT NULL,
	company_id      	int(11) NULL 
	)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(1, 'Metro Rail', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(2, 'Airports', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(3, 'Power Projects', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(4, 'Business Centre', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(5, 'Hotels & Resorts', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(6, 'Malls', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(7, 'Hospitals', 1)
GO
INSERT INTO sscorp_project_category_m(project_cat_id, project_category, company_id)
  VALUES(8, 'Miscellaneous', 1)
GO
ALTER TABLE sscorp_project_category_m
	ADD CONSTRAINT PRIMARY
	PRIMARY KEY (project_cat_id)
GO
ALTER TABLE sscorp_project_category_m
	ADD CONSTRAINT project_cat_fk
	FOREIGN KEY(company_id)
	REFERENCES sscorp_companyProfile_m(company_id)
GO
