SET SQL_SAFE_UPDATES = 0; -- sets to safe mode

-- This statement is to delete table PROB_1_01
-- Only use it when the table is present. Otherwise, comment it out
-- DROP TABLE PROB_1_01;

-- This statement will create the table
CREATE TABLE PROB_1_01 (
	PROJECT_CODE 		VARCHAR(5),
	PROJECT_MANAGER 	VARCHAR(15),
	MANAGER_PHONE 		VARCHAR(12),
	MANAGER_ADDRESS 	VARCHAR(38),
	PROJECT_BID_PRICE 	NUMERIC(8)
);

-- These statements will insert the data into the table
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE)
	VALUES('21-5Z','Holly B. Parker','904-338-3416','3334 Lee Rd., Gainesville, FL  37123',16833460);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('25-2D','Jane D. Grant','615-898-9909','218 Clark Blvd., Nashville, TN  36362',12500000);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('25-5A','George F. Dorts','615-227-1245','124 River Dr., Franklin, TN  29185',32512420);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('25-9T','Holly B. Parker','904-338-3416','3334 Lee Rd., Gainesville, FL  37123',21563234);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('27-4Q','George F. Dorts','615-227-1245','124 River Dr., Franklin, TN  29185',10314545);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('29-2D','Holly B. Parker','904-338-3416','3334 Lee Rd., Gainesville, FL  37123',25559999);
INSERT INTO PROB_1_01(PROJECT_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE) 
	VALUES('31-7P','William K. Moor','904-445-2719','216 Morton Rd., Stetson, FL  30155',56850000);

UPDATE PROB_1_01											-- updates the table
SET PROJECT_MANAGER = 'William K. Wells'					-- Sets PROJECT_MANAGER to William K. Wells
WHERE PROJECT_CODE = '31-7P';								-- at the place where the PROJECT CODE is 31-7P
-- This does not introduce any UDATE anomoly because there are no other 31-7Ps

UPDATE PROB_1_01
SET MANAGER_PHONE = '904-338-ZOOM'
WHERE PROJECT_CODE = '21-5Z';
-- redundant data, partial update, and inconsistency
-- redundant data: table stores MANAGER_PHONE and MANAGER ADDRESS repeately for each project managed by the same person
-- Partial Udate: the UPDATE only changes phone for one specific project (21-5Z), but not for other projects managed by the same person
-- Inconsistency: after the update, Holly B. Parker will have different phone numbers for different projects, which is logically inconsistent

-- set up a primary key on the PROJECT_CODE column

INSERT INTO PROB_1_01
(Project_CODE, PROJECT_MANAGER, MANAGER_PHONE, MANAGER_ADDRESS, PROJECT_BID_PRICE)
VALUES('','Will Smith','507-389-6621','123 Wissink Hall, Mankato, MN 56001',0);
-- the primary key is blank

DELETE FROM PROB_1_01
WHERE PROJECT_MANAGER = 'Jane D. Grant';

SELECT PROJECT_BID_PRICE
FROM PROB_1_01
WHERE PROJECT_CODE = '25-2D';
-- becuase when you select 25-2D after deleting it, the SQL interpreter doesn't know where that data is becuase it no longer exists
