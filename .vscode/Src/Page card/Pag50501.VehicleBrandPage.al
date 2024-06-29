page 50512 "Vehicle Brand Page"
{
    ApplicationArea = All;
    Caption = 'Vehicle Brand Page';
    PageType = List;
    SourceTable = "Vehicle Brand";
    UsageCategory = Administration;
    InsertAllowed = true;
    Editable = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Brand Name"; Rec."Brand Name")
                {
                    Caption = 'Code';
                    ToolTip = 'Specifies the value of the Brand Name field.', Comment = '%';
                    Editable = true;
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    Editable = true;
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    
}
