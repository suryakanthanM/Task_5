table 50511 "Vehicle Color"
{
    DataClassification = CustomerContent;
    LookupPageId = "Color Page";

    fields
    {
        field(1; color; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Code';
        }
        field(21; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; color)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
