IF OBJECT_ID('tempdb.dbo.PeerCheckResults') IS NOT NULL
    DROP TABLE tempdb.dbo.PeerCheckResults;

CREATE TABLE tempdb.dbo.PeerCheckResults (
    logdatetime datetime2 NOT NULL DEFAULT SYSDATETIME(),
    PeerCheck VARCHAR(255),
    Results VARCHAR(MAX),
    outcome VARCHAR(255)
)

Insert into tempdb.dbo.PeerCheckResults (PeerCheck, Results, outcome)
values ('Peer Check', 'Peer Check table created successfully.', 'Success');