pageextension 50521 Agree_Page extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field("No."; Rec."No.")
            {
                caption = 'Agreement No';
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