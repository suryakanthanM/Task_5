pageextension 50510 Vin_Page extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("Vin_No."; Rec."Vin_No.")
            {
                ApplicationArea = All;
                TableRelation = "No. Series";
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}