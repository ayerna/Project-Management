CREATE DATABASE IF NOT EXISTS electiondb;
USE electiondb;

CREATE TABLE PollingStation (
PollingID INT PRIMARY KEY,
StationName VARCHAR(100),
Location VARCHAR(150)
);

CREATE TABLE Electoral_Officer (
OfficerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
PollingStationID INT,
FOREIGN KEY (PollingStationID) REFERENCES PollingStation(PollingID)
);

CREATE TABLE Election (
ElectionID INT PRIMARY KEY,
ElectionName VARCHAR(100),
StartDate DATE,
EndDate DATE
);

CREATE TABLE Party (
PartyID INT PRIMARY KEY,
PartyName VARCHAR(100),
LeaderName VARCHAR(100),
Symbol VARCHAR(20)
);

CREATE TABLE Voter (
VoterID INT PRIMARY KEY,
FirstName VARCHAR(50),
MiddleName VARCHAR(50),
LastName VARCHAR(50),
Age INT,
Gender VARCHAR(10),
Address VARCHAR(200),
PollingID INT,
FOREIGN KEY (PollingID) REFERENCES PollingStation(PollingID)
);

CREATE TABLE Candidate (
CandidateID INT PRIMARY KEY,
FirstName VARCHAR(50),
MiddleName VARCHAR(50),
LastName VARCHAR(50),
PartyID INT,
ElectionID INT,
FOREIGN KEY (PartyID) REFERENCES Party(PartyID),
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID)
);

CREATE TABLE Ballot (
BallotID INT PRIMARY KEY,
VoterID INT,
CandidateID INT,
ElectionID INT,
FOREIGN KEY (VoterID) REFERENCES Voter(VoterID),
FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID),
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID)
);

CREATE TABLE Result (
ResultID INT PRIMARY KEY,
ElectionID INT,
CandidateID INT,
TotalVotes INT,
FOREIGN KEY (ElectionID) REFERENCES Election(ElectionID),
FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);