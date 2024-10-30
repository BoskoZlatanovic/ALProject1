page 50104 "Reservation Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = History;
    SourceTable = "Reservation Ledger Entry";
    Editable = false;  // Ledger entries cannot be modified
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("EntryId"; Rec."EntryId")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the ledger entry';
                }
                
                field("Golf Course Code"; Rec."Golf Course Code")
                {
                    ApplicationArea = All;
                }
                
                field("Date of Play"; Rec."Date of Play")
                {
                    ApplicationArea = All;
                }
                
                field("Reservation Type"; Rec."Reservation Type")
                {
                    ApplicationArea = All;
                }
                
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                }
                
                field("PlannedPlayers"; Rec."PlannedPlayers")
                {
                    ApplicationArea = All;
                }
                
                field("StartTime"; Rec."StartTime")
                {
                    ApplicationArea = All;
                }
                
                field("PlayedPlayers"; Rec."PlayedPlayers")
                {
                    ApplicationArea = All;
                }
                
                field("Total Fees"; Rec."Total Fees")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}