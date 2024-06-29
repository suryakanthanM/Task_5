namespace Task_.Task_;

page 50501 MainList
{
    ApplicationArea = All;
    Caption = 'MainList';
    PageType = List;
    SourceTable = Agreement_Header;
    UsageCategory = Lists;
    CardPageId = "Rental Agreement";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Agreement No. field.', Comment = '%';
                }
                // field(Brand; Rec.Brand)
                // {
                //     ToolTip = 'Specifies the value of the Brand field.', Comment = '%';
                // }
                // field("Model No."; Rec."Model No.")
                // {
                //     ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                // }
                // field("Access of car"; Rec."Access of car")
                // {
                //     ToolTip = 'Specifies the value of the Access of car field.', Comment = '%';
                // }
                field("Vin No."; Rec."Vin No.")
                {
                    ToolTip = 'Specifies the value of the VIN No. field.', Comment = '%';
                }
                // field(Color; Rec.Color)
                // {
                //     ToolTip = 'Specifies the value of the Color field.', Comment = '%';
                // }
                // field(Description; Rec.Description)
                // {
                //     ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                // }
                // field("Year of manufacture"; Rec."Year of manufacture")
                // {
                //     ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                // }
                field("Rental Customer"; Rec."Rental Customer")
                {
                    ToolTip = 'Specifies the value of the Rental Customer field.', Comment = '%';
                }
                field("Rental Start Date"; Rec."Rental Start Date")
                {
                    ToolTip = 'Specifies the value of the Rental Start Date field.', Comment = '%';
                }
                field("Rental End Date"; Rec."Rental Expire Date")
                {
                    ToolTip = 'Specifies the value of the Rental Expire Date field.', Comment = '%';
                }
            }
        }
    }
}
