table 50512 "Agreement_Header"

{
    DataClassification = ToBeClassified;
    Caption = 'Agreement_Header';
    // LookupPageId = "Customer List";


    fields
    {
        field(1; "No."; code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Agreement No.';
            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
                sales_setup: Record "Sales & Receivables Setup";

            begin
                if Rec."No." = '' then begin
                    sales_setup.Get();
                    sales_setup.TestField("No.");
                    Rec."No." := NoSeries.GetNextNo(sales_setup."No.", Today);

                end;

            end;


        }
        field(21; "Vin No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'VIN No.';
            TableRelation = "Vehicle details";
        }
        field(22; "Rental Customer"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Rental Customer';
            TableRelation = customer;
            Editable=False;


        }
        field(40;"Customer Name";Text[100]){
            DataClassification=ToBeClassified;
        }
        field(39; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Description';
            // trigger OnValidate()
            // var
            //     Agree_line: Record Agreement_Line;
            // begin
            //     Agree_line.SetRange("Agreement No.", Rec."No.");
            //     Agree_Line.FindSet();
            //     Agree_line.Description := Rec.Description;
            //     Agree_Line.Modify();
            // end;

        }
        field(23; "Rental Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rental Start Date';
        }
        field(24; "Rental Expire Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Rental Expire Date';
        }
        Field(25; "Invoice Frequency"; DateFormula)
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice Frequency';
        }

        field(26; Mileage; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mileage';
        }

        field(27; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = False;
        }
        field(28; "Customer Support By"; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Support By';
        }
        field(29; Brand; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Brand';

        }
        field(30; "Year of manufacture"; date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Year';

        }
        field(31; "Model No."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Model';

        }

        field(32; "Fuel Type"; option)
        {
            OptionMembers = " ","Petrol","Disel","EV";
            DataClassification = ToBeClassified;

        }
        field(33; Color; Text[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Color';


        }
        field(34; "Charge per Invoice"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Charge Per Invoice';
        }
        field(35; "Mileage Limited"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Mileage Limit For Customer';
        }
        Field(36; "Access of car"; Code[40])
        {
            DataClassification = ToBeClassified;
            Caption = 'Access of car';
        }
        field(37; "Security Deposit"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Security Deposit';
        }
        field(38; "Exiting Damage"; Text[100])
        {
            Caption = 'Exiting Damage';

        }

    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
        sales_setup: Record "Sales & Receivables Setup";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeInsert(Rec, IsHandled);
        if IsHandled then
            exit;

        if Rec."No." = '' then begin
            sales_setup.Get();
            sales_setup.TestField("No.");
            Rec."No." := NoSeries.GetNextNo(sales_setup."No.", Today);

        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var "Agreement_Header": Record "Agreement_Header"; var IsHandled: Boolean)
    begin
    end;


}

