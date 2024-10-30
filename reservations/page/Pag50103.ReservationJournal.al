page 50103 "Reservation Journal"
{
    PageType = Worksheet;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Reservation Jnl. Line";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Golf Course Code"; Rec."Golf Course Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the golf course for this reservation.';
                }
                
                field("Date of Play"; Rec."Date of Play")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the game will be played.';
                }
                
                field("Reservation Type"; Rec."Reservation Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of reservation.';
                }
                
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member ID for member reservations.';
                    Visible = Rec."Reservation Type" = Rec."Reservation Type"::Member;
                }
                
                field("PlannedPlayers"; Rec."PlannedPlayers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the planned number of players.';
                }
                
                field("StartTime"; Rec."StartTime")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting time for the game.';
                }
                
                field("PlayedPlayers"; Rec."PlayedPlayers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the actual number of players who played.';
                }
                
                field("Total Fees"; Rec."Total Fees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows the calculated total fees for this reservation.';
                }
            }
        }
    }
    actions
{
    area(Processing)
    {
        action(Post)
        {
            ApplicationArea = All;
            Caption = 'Post';
            Image = PostOrder;
            Promoted = true;
            PromotedCategory = Process;
            PromotedIsBig = true;
            
            trigger OnAction()
            var
                ResJnlLine: Record "Reservation Jnl. Line";
                PostBatch: Codeunit "Res. Jnl. Line - Post Batch";
            begin
                ResJnlLine.Copy(Rec);
                PostBatch.PostBatch(ResJnlLine);
                CurrPage.Update(false);
            end;
        }
    }
}
}