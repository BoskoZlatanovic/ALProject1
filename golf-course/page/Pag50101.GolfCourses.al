page 50101 "Golf Courses"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Golf Course";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter unique code for the golf course';
                }
                
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter name of the golf course';
                }
                
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter address of the golf course';
                }
                
                field("Green Fees"; Rec."Green Fees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the fee for one person to play';
                }

                field("Reservation Count"; Rec."Reservation Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows number of reservations in the selected date range';
                }

                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows total amount for reservations in the selected date range';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(ReservationLedger)
            {
                ApplicationArea = All;
                Caption = 'Reservation Ledger';
                Image = Ledger;
                Promoted = true;  
                PromotedCategory = Process;  // main ribbon
                RunObject = page "Reservation Ledger Entries";
                RunPageLink = "Golf Course Code" = field(Code);
                ToolTip = 'View reservation history for this golf course';
            }
        }
    }
}