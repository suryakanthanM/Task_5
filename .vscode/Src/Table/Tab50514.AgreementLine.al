table 50514 "Agreement_Line"
{
    LookupPageId = "Model List";
    DataClassification = ToBeClassified;
    Caption = 'Agreemnet Line';

    fields
    {

        field(1; "Agreement No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Agreement No.';


        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Line No.';
        }
        field(21; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item No.';
            TableRelation = item;
            trigger OnValidate()
            var
                Des: Record item;
            begin
                if Des.Get("Item No.") then begin
                    Rec.Description := Des.Description;
                end;

            end;
        }
        field(22; Description; Text[100])
        {
            DataClassification = ToBeClassified;
            // FieldClass = flowfield;
            Caption = 'Description';
            // CalcFormula = lookup(Agreement_Header.Description where("No." = field("Agreement No.")));


        }
        
        field(23; "Quantity"; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;

        }
        field(24; "Quantity to invoice"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity to invoice';
        }
        field(25; "Unit Price"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Unit price';



        }
        field(26; "Quantity Invoiced"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity Invoiced';


        }
        field(27; "Total Amount"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Amount';


        }
    }

    keys
    {
        key(Key1; "Agreement No.", "Line No.")
        {
            Clustered = true;
        }
    }

}