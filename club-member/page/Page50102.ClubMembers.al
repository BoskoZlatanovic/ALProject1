page 50102 "Club Members"
{
    PageType = List;               //page bude lista
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Club Member";   // referenca na tabelu

    layout
    {
        area(Content)
        {
            repeater(GroupName)    //ponavlja redove
            {
                field("Member ID"; Rec."Member ID")
                {
                    ApplicationArea = All;
                    // ToolTip = 'Specifies the unique identifier for the member.';
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member''s full name.';
                }

                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the member''s address.';
                }

                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the type of membership (Corporate, Gold, or Family).';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether the member is active or inactive.';
                }

                field("Total Reservations"; Rec."Total Reservations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows total number of reservations in the selected date range';
                }

                field("Total Spent"; Rec."Total Spent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows total amount spent on reservations in the selected date range';
                }

                field("Average Group Size"; Rec."Average Group Size")
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows average number of players per reservation';
                }
            }
        }
    }
}