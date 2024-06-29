table 50509 "Vehicle details"
{
    // LookupPageId="Model List";
    DataClassification = ToBeClassified;
    Caption = 'Vehicle Table';

    fields
    {
        field(1; "Vin_No."; code[20])
        {
            DataClassification = ToBeClassified;
            // NotBlank = true;
            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
                sales_setup: Record "Sales & Receivables Setup";

            begin
                if Rec."Vin_No." = '' then begin
                    sales_setup.Get();
                    sales_setup.TestField("Vin_No.");
                    Rec."Vin_No." := NoSeries.GetNextNo(sales_setup."Vin_No.", Today);

                end;

            end;


        }
        field(21; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        // field(28; "Customer_No."; code[20])
        // {
        //     DataClassification = ToBeClassified;
        //     TableRelation = Customer;
        // }

        field(22; "Model No."; code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = item where(Enum = filter(Model));

            Editable = true;

        }
        field(35; "Rental Customer"; code[100])
        {
            DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     VehicleDetails: Record Customer;
            // begin
            //     if VehicleDetails.Get(Rec."Rental Customer") then begin
            //         Rec."Customer Name" := VehicleDetails.Name;
            //     end;
            // end;

        }
        // field(36; "CustomerName"; Text[100])
        // {
        //     DataClassification = ToBeClassified;
        // }
        field(23; "Brand_ Name"; Text[100])
        {
            // DataClassification = ToBeClassified;

            TableRelation = "Vehicle Brand";
            FieldClass = flowfield;
            CalcFormula = lookup(item.Description where("No." = field("Model No.")));

        }
        field(24; "Color"; Text[20])
        {
            TableRelation = "Vehicle Color";
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(25; "Mileage"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Description"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Data_Of_Manufacture"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Start_Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Expire_Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Fule_Type"; Option)
        {
            OptionMembers = " ","Petrol","Disel","EV";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PrimaryKey; "Vin_No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
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

        if Rec."Vin_No." = '' then begin
            sales_setup.Get();
            sales_setup.TestField("Vin_No.");
            Rec."Vin_No." := NoSeries.GetNextNo(sales_setup."Vin_No.", Today);

        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsert(var "Vehicle details": Record "Vehicle details"; var IsHandled: Boolean)
    begin
    end;

}