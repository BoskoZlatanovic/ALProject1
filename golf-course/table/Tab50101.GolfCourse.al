table 50101 "Golf Course"
{
    // koliko je data sensitive, zbog GDPR?
    DataClassification = CustomerContent;  

    DrillDownPageId = "Golf Courses";  
    LookupPageId = "Golf Courses";     
   
   // ovo su kao kolone u bazama
   fields  
   {

        // "Code" je pod navodnicima jer je rezervisana rec
        // Ovo je unique ID koji ima max 20 karaktera
       field(1; "Code"; Code[20])  
       {
           //ovako ce pisati na interface-u
           Caption = 'Code';  
           
        // privatnost
           DataClassification = CustomerContent;
           
           // mora da bude popunjeno
           NotBlank = true;  
       }

       
       field(2; Name; Text[100])  
       {
           Caption = 'Name';
           DataClassification = CustomerContent;
       }

       field(3; Address; Text[100])  
       {
           Caption = 'Address';
           DataClassification = CustomerContent;
       }

       field(4; "Green Fees"; Decimal)  
       {
           Caption = 'Green Fees';
           DataClassification = CustomerContent;

           // ne moze da bude negativno
           MinValue = 0;  
    
           DecimalPlaces = 2;  
       }

       field(5; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;  //filter field
        }

        field(6; "Reservation Count"; Integer)
        {
            Caption = 'Reservation Count';
            FieldClass = FlowField;
            CalcFormula = count("Reservation Ledger Entry" 
                where("Golf Course Code" = field(Code),
                      "Date of Play" = field("Date Filter")));  // our filter
            Editable = false;
        }

        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Reservation Ledger Entry"."Total Fees"
                where("Golf Course Code" = field(Code),
                      "Date of Play" = field("Date Filter")));
            Editable = false;
            DecimalPlaces = 2;
        }
   }

   // primary i foreign kljucevi
   keys  
   {
       
       key(PK; Code)  
       {
           // Clustered = true means the data will be physically stored
           // ordered by this key, making lookups faster
           Clustered = true;  
       }
   }
}