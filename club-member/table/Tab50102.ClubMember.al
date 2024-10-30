table 50102 "Club Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Member ID"; Code[20])
        {
            Caption = 'Member ID';
            DataClassification = CustomerContent;
            NotBlank = true;
        }

        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
            NotBlank = true;
        }

        field(3; Address; Text[100])  
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(4; "Member Type"; Enum "Club Member Type")
        {
            Caption = 'Member Type';
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum "Member Status")
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        //FlowFilter
        field(6; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }

        //FlowFields
        field(7; "Total Reservations"; Integer)
        {
            Caption = 'Total Reservations';
            FieldClass = FlowField;
            CalcFormula = count("Reservation Ledger Entry" 
                where("Member ID" = field("Member ID"),
                      "Date of Play" = field("Date Filter")));
            Editable = false;
        }

        field(8; "Total Spent"; Decimal)
        {
            Caption = 'Total Spent';
            FieldClass = FlowField;
            CalcFormula = sum("Reservation Ledger Entry"."Total Fees"
                where("Member ID" = field("Member ID"),
                      "Date of Play" = field("Date Filter")));
            Editable = false;
            DecimalPlaces = 2;
        }

        field(9; "Average Group Size"; Integer)  
        {
            Caption = 'Average Group Size';
            FieldClass = FlowField;
            CalcFormula = average("Reservation Ledger Entry"."PlannedPlayers" 
                where("Member ID" = field("Member ID"),
                    "Date of Play" = field("Date Filter")));
            Editable = false;
        }
    }

   keys
   {
       key(PK; "Member ID")
       {
           Clustered = true;
       }
   }
}