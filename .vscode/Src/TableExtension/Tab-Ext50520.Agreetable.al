tableextension 50520 "Agree_table" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "No."; code[20])
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