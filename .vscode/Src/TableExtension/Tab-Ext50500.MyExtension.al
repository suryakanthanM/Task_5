tableextension 50500 MyExtension extends Item
{
    fields
    {
        field(5001; Enum; Enum "Product Type")
        {
            DataClassification = ToBeClassified;
        }
        field(5002; Items; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Model Name';
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                Rec.Enum := Rec.Enum::Model;
                Rec.Modify();
            end;

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