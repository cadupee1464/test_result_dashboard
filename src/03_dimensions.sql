CREATE TABLE student AS
SELECT 
DISTINCT StudentIdentifier,
CASE WHEN TRIM(UPPER(MigrantStatus)) = 'YES' THEN 1
WHEN TRIM(UPPER(MigrantStatus)) = 'NO' THEN 0
END AS IsMigrant,
LanguageCode,
LanguageAltCode,
EnglishLanguageAcquisitionStatus,
CASE WHEN TRIM(UPPER(HispanicOrLatinoEthnicity)) = 'YES' THEN 1
WHEN TRIM(UPPER(HispanicOrLatinoEthnicity)) = 'NA' THEN 0
END AS IsHispanicOrLatino,
CASE WHEN TRIM(UPPER(AmericanIndianOrAlaskaNative)) = 'YES' THEN 1
WHEN TRIM(UPPER(AmericanIndianOrAlaskaNative)) = 'NA' THEN 0
END AS IsAmericanIndianOrAlaskaNative,
CASE WHEN TRIM(UPPER(Asian)) = 'YES' THEN 1
WHEN TRIM(UPPER(Asian)) = 'NA' THEN 0
END AS IsAsian,
CASE WHEN TRIM(UPPER(BlackOrAfricanAmerican)) = 'YES' THEN 1
WHEN TRIM(UPPER(BlackOrAfricanAmerican)) = 'NA' THEN 0
END AS IsBlackOrAfricanAmerican,
CASE WHEN TRIM(UPPER(White)) = 'YES' THEN 1
WHEN TRIM(UPPER(White)) = 'NA' THEN 0
END AS IsWhite,
CASE WHEN TRIM(UPPER(NativeHawaiianOrOtherPacificIslander)) = 'YES' THEN 1
WHEN TRIM(UPPER(NativeHawaiianOrOtherPacificIslander)) = 'NA' THEN 0
END AS IsNativeHawaiianOrOtherPacificIslander,
CASE WHEN TRIM(UPPER(TwoOrMoreRaces)) = 'YES' THEN 1
WHEN TRIM(UPPER(TwoOrMoreRaces)) = 'NA' THEN 0
END AS IsTwoOrMoreRaces,
CASE WHEN TRIM(UPPER(Filipino)) = 'YES' THEN 1
WHEN TRIM(UPPER(Filipino)) = 'NA' THEN 0
END AS IsFilipino
FROM stg;

CREATE TABLE test AS
SELECT DISTINCT
AssessmentName,
Subject,
AssessmentType,
AssessmentSubType
FROM stg;

CREATE TABLE school AS
SELECT DISTINCT
SchoolName
FROM stg;

ALTER TABLE school
ADD SchoolID VARCHAR(3);

UPDATE school
SET SchoolId = RIGHT(SchoolName, 3);
