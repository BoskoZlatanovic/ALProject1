codeunit 50102 "Res. Jnl. Line - Post Line"
{
    procedure PostLine(var ResJnlLine: Record "Reservation Jnl. Line")
    var
        ResLedgerEntry: Record "Reservation Ledger Entry";
        GolfCourse: Record "Golf Course";
        ClubMember: Record "Club Member";
    begin
        // Verify Golf Course exists using Get
        if not GolfCourse.Get(ResJnlLine."Golf Course Code") then
            Error('Golf Course %1 does not exist.', ResJnlLine."Golf Course Code");
            
        // Better member verification using SetRange and FindFirst
        if ResJnlLine."Reservation Type" = ResJnlLine."Reservation Type"::Member then
        begin
            ClubMember.SetRange("Member ID", ResJnlLine."Member ID");
            ClubMember.SetRange(Status, ClubMember.Status::Active);
            if not ClubMember.FindFirst() then
                Error('Active member %1 does not exist.', ResJnlLine."Member ID");
        end;
                
        // Create ledger entry using recommended methods
        ResLedgerEntry.Init();
        ResLedgerEntry.TransferFields(ResJnlLine);  // Copy all matching fields
        ResLedgerEntry."EntryId" := GetNextEntryNo();
        ResLedgerEntry.Insert(true);  // true for validation
    end;

    local procedure GetNextEntryNo(): Integer
    var
        ResLedgerEntry: Record "Reservation Ledger Entry";
    begin
        ResLedgerEntry.Reset();
        ResLedgerEntry.SetCurrentKey("EntryId");  // Make sure we're sorting by EntryId
        if ResLedgerEntry.FindLast() then
            exit(ResLedgerEntry."EntryId" + 1)
        else
            exit(1);
    end;
}