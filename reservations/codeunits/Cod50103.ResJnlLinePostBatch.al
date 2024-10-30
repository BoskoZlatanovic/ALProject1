codeunit 50103 "Res. Jnl. Line - Post Batch"
{
    procedure PostBatch(var ResJnlLine: Record "Reservation Jnl. Line")
    var
        CheckLine: Codeunit "Res. Jnl. Line - Check Line";
        PostLine: Codeunit "Res. Jnl. Line - Post Line";
        Confirmation: Label 'Do you want to post the journal lines?';
    begin
        if not Confirm(Confirmation) then
            exit;

        // First check all lines
        ResJnlLine.Reset();
        if ResJnlLine.FindSet() then
            repeat
                CheckLine.CheckLine(ResJnlLine);
            until ResJnlLine.Next() = 0;
            
        // If all lines are valid, post them
        ResJnlLine.Reset();
        if ResJnlLine.FindSet() then
            repeat
                PostLine.PostLine(ResJnlLine);
            until ResJnlLine.Next() = 0;
            
        // Delete posted lines from journal
        ResJnlLine.DeleteAll();
        
        Message('The journal lines have been successfully posted.');
    end;
}