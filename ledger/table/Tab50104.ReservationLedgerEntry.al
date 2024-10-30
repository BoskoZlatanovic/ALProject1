table 50104 "Reservation Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "EntryId"; Integer)
        {
            Caption = 'Entry ID';
            DataClassification = CustomerContent;
        }
        
        field(2; "Golf Course Code"; Code[20])
        {
            Caption = 'Golf Course Code';
            TableRelation = "Golf Course";
        }
        
        field(3; "Date of Play"; Date)
        {
            Caption = 'Date of Play';
        }
        
        field(4; "Reservation Type"; Enum "Reservation Type")
        {
            Caption = 'Reservation Type';
        }
        
        field(5; "Member ID"; Code[20])
        {
            Caption = 'Member ID';
            TableRelation = "Club Member";
        }
        
        field(6; "PlannedPlayers"; Integer)
        {
            Caption = 'Planned Players';
        }
        
        field(7; "StartTime"; Time)
        {
            Caption = 'Start Time';
        }
        
        field(8; "PlayedPlayers"; Integer)
        {
            Caption = 'Players Who Played';
        }
        
        field(9; "Total Fees"; Decimal)
        {
            Caption = 'Total Fees';
            DecimalPlaces = 2;
        }
    }
    
    keys
    {
        key(PK; "EntryId")
        {
            Clustered = true;
        }

        key(DatePlay; "Date of Play")
        {
        }
        key(Course; "Golf Course Code", "Date of Play")
        {
        }
    }
}