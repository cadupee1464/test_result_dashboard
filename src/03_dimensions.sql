CREATE TABLE student AS
SELECT 
DISTINCT StudentIdentifier,
CASE WHEN TRIM(UPPER(MigrantStatus)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(MigrantStatus)) = 'NO' THEN FALSE
END AS IsMigrant,
LanguageCode,
LanguageAltCode,
EnglishLanguageAcquisitionStatus,
CASE WHEN TRIM(UPPER(HispanicOrLatinoEthnicity)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(HispanicOrLatinoEthnicity)) = 'NA' THEN FALSE
END AS IsHispanicOrLatino,
CASE WHEN TRIM(UPPER(AmericanIndianOrAlaskaNative)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(AmericanIndianOrAlaskaNative)) = 'NA' THEN FALSE
END AS IsAmericanIndianOrAlaskaNative,
CASE WHEN TRIM(UPPER(Asian)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(Asian)) = 'NA' THEN FALSE
END AS IsAsian,
CASE WHEN TRIM(UPPER(BlackOrAfricanAmerican)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(BlackOrAfricanAmerican)) = 'NA' THEN FALSE
END AS IsBlackOrAfricanAmerican,
CASE WHEN TRIM(UPPER(White)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(White)) = 'NA' THEN FALSE
END AS IsWhite,
CASE WHEN TRIM(UPPER(NativeHawaiianOrOtherPacificIslander)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(NativeHawaiianOrOtherPacificIslander)) = 'NA' THEN FALSE
END AS IsNativeHawaiianOrOtherPacificIslander,
CASE WHEN TRIM(UPPER(TwoOrMoreRaces)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(TwoOrMoreRaces)) = 'NA' THEN FALSE
END AS IsTwoOrMoreRaces,
CASE WHEN TRIM(UPPER(Filipino)) = 'YES' THEN TRUE
WHEN TRIM(UPPER(Filipino)) = 'NA' THEN FALSE
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
