tableextension 50512 "Vin_table" extends "Sales & Receivables Setup"
{
    fields
    {
        field(6000; "Vin_No."; code[20])
        {
            DataClassification = ToBeClassified;
            Tablerelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}