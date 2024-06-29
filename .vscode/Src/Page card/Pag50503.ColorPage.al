page 50514 "Color Page"
{
    ApplicationArea = All;
    Caption = 'Color Page';
    PageType = List;
    SourceTable = "Vehicle Color";
    UsageCategory = Lists;
    Editable = true;
    InsertAllowed = true;
    DeleteAllowed = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(color; Rec.color)
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                
            }
        }
    }
}
