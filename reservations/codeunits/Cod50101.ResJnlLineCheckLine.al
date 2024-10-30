codeunit 50101 "Res. Jnl. Line - Check Line"
{
    // Checks if a journal line is valid for posting
    procedure CheckLine(var ResJnlLine: Record "Reservation Jnl. Line")
    begin
        // Verify required fields are filled
        if ResJnlLine."Golf Course Code" = '' then
            Error('Golf Course Code must be specified.');
            
        if ResJnlLine."Date of Play" = 0D then  // 0D means empty date
            Error('Date of Play must be specified.');
            
        // Check Member ID if it's a member reservation
        if (ResJnlLine."Reservation Type" = ResJnlLine."Reservation Type"::Member) and 
           (ResJnlLine."Member ID" = '') then
            Error('Member ID must be specified for Member type reservations.');
            
        if ResJnlLine."PlannedPlayers" <= 0 then
            Error('Number of Players must be greater than 0.');
    end;
}