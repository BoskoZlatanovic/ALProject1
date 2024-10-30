table 50103 "Reservation Jnl. Line"
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
            NotBlank = true;
            
            trigger OnValidate()
            begin
                CalculateTotalFees();
            end;
        }
        
        field(3; "Date of Play"; Date)
        {
            Caption = 'Date of Play';
            NotBlank = true;
        }
        
        field(4; "Reservation Type"; Enum "Reservation Type")
        {
            Caption = 'Reservation Type';
            
            trigger OnValidate()
            begin
                CalculateTotalFees();
            end;
        }
        
        field(5; "Member ID"; Code[20])
        {
            Caption = 'Member ID';
            TableRelation = "Club Member" where(Status = const(Active));
            
            trigger OnValidate()
            begin
                TestField("Golf Course Code");

                if "Reservation Type" = "Reservation Type"::Member then begin
                    if "Member ID" = '' then
                        Error('Member ID must be specified for Member type reservations.');
                end else
                    if "Member ID" <> '' then
                        Error('Member ID can only be entered for Member type reservations.');    
                    end;
        }
        
        field(6; "PlannedPlayers"; Integer)
        {
            Caption = 'Planned Players';
            MinValue = 1;
            
            trigger OnValidate()
            begin
                CalculateTotalFees();
            end;
        }
        
        field(7; "StartTime"; Time) 
        {
            Caption = 'Start Time';
        }
        
        field(8; "PlayedPlayers"; Integer) 
        {
            Caption = 'Players Who Played';
            MinValue = 0;
            
            trigger OnValidate()
            begin
                CalculateTotalFees();
            end;
        }
        
        field(9; "Total Fees"; Decimal)
        {
            Caption = 'Total Fees';
            Editable = false;
            DecimalPlaces = 2;
        }
    }
    
    keys
    {
        key(PK; "EntryId") 
        {
            Clustered = true;
        }
    }

    local procedure CalculateTotalFees()
    
    var
        GolfCourse: Record "Golf Course";
        NumberOfPlayers: Integer;
        BaseFee: Decimal;
    begin
        if ("Golf Course Code" = '') or ("PlannedPlayers" = 0) then
            exit;
            
        if not GolfCourse.Get("Golf Course Code") then
            exit;
            
        // Use actual players if entered, otherwise use planned number
        NumberOfPlayers := "PlayedPlayers";
        if NumberOfPlayers = 0 then
            NumberOfPlayers := "PlannedPlayers";
            
        BaseFee := GolfCourse."Green Fees" * NumberOfPlayers;
        
        case "Reservation Type" of
            "Reservation Type"::Public:
                "Total Fees" := BaseFee * 1.1;  // 10% surcharge
            "Reservation Type"::Comp:
                "Total Fees" := 0;
            else
                "Total Fees" := BaseFee;
        end;
    end;
}