table 50510 "Vehicle Brand"
{
    LookupPageId = "Vehicle Brand Page";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Brand Name"; Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }

        field(21; Description; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
    }

    keys
    {
        key(Key1; "Brand Name")
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